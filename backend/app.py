from flask import Flask, request
from uuid import uuid4
from asyncio import sleep
from os import makedirs

from db import get_db
from llm import process_recording

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello, World!"


"""
{"name": "Alan", "contact_number": "90001234"}
"""
@app.route("/api/register", methods=["POST"])
def register():
    data = request.json
    # Assume data is correct
    db, cursor = get_db()
    user_id = uuid4().hex
    cursor.execute("INSERT INTO users VALUES (?, ?, ?)", [user_id, data.get("name"), data.get("contact_number")])
    db.commit()
    db.close()
    return {"status": "ok", "message": "Registration successful", "user_id": user_id}


"""
{"caller": "+6590001234", "user": "9760538f-6148-48e8-8e74-6ca0eb707715"}
"""
@app.route("/api/start_call", methods=["POST"])
def start_call():
    data = request.json
    # Assume data is correct
    db, cursor = get_db()
    call_id = uuid4().hex
    cursor.execute("INSERT INTO calls (id, caller, user) VALUES (?, ?, ?)", [call_id, data.get("caller"), data.get("user")])
    db.commit()
    db.close()
    return {"status": "ok", "message": "Call started", "call_id": call_id}


"""
/api/call_recording?call_id=9760538f-6148-48e8-8e74-6ca0eb707715&sequence=0
"""
@app.route("/api/call_recording", methods=["POST"])
def call_recording():
    call_id, sequence = request.args.get("call_id"), request.args.get("sequence")

    # Get existing transcript
    db, cursor = get_db()
    existing_transcript = cursor.execute("SELECT transcript FROM calls WHERE id = ?", [call_id]).fetchone().get("transcript")

    # Write file to folder
    makedirs(call_id, exist_ok=True)
    recording = request.files["recording"]
    with open(f"{call_id}/recording_{sequence.format('%02d')}.wav", "wb") as file:
        file.write(recording.read())

    transcript, scam_detected, scam_type = process_recording(call_id, existing_transcript)
    cursor.execute("UPDATE calls SET transcript = ?, scam_detected = ?, scam_type = ? WHERE id = ?", [transcript, scam_detected, scam_type, call_id])
    db.commit()
    db.close()
    return {"status": "ok", "message": "Recording processed", "scam_detected": scam_detected, "scam_type": scam_type}


@app.route("/api/end_call/<call_id>", methods=["GET"])
def end_call(call_id):
    # Assume data is correct
    db, cursor = get_db()
    cursor.execute("UPDATE calls SET status = ? WHERE id = ?", ["ended", call_id])
    db.commit()
    db.close()
    return {"status": "ok", "message": "Call ended"}


"""
{"user": "9760538f-6148-48e8-8e74-6ca0eb707715", "contact": "90001234"}
"""
@app.route("/api/add_alert_contact", methods=["POST"])
def add_alert_contact():
    data = request.json
    user, contact_number = data.get("user"), data.get("contact")
    db, cursor = get_db()
    # Find contact from user list
    contact_user = cursor.execute("SELECT id FROM users WHERE contact_number = ?", [contact_number]).fetchone()
    if len(contact_user) == 0:
        return {"status": "failure", "message": "Contact is not registered on the app"}
    cursor.execute("INSERT INTO alert_contact (user, contact) VALUES (?, ?)", [user, contact_user.get("id")])
    db.commit()
    db.close()
    return {"status": "ok", "message": "Alert contact added"}


@app.route("/api/poll_scam_alert/<user_id>", methods=["GET"])
def poll_scam_alert(user_id):
    # Assume data is correct
    db, cursor = get_db()
    scam_calls = cursor.execute("""
        SELECT calls.id, name
        FROM calls, users
        WHERE user IN (SELECT id FROM alert_contact WHERE contact = ?)
        AND scam_detected = 1
        AND status = 'in_progress'
        AND user = users.id
    """, [user_id]).fetchall()
    db.close()
    return {"status": "ok", "scam_calls": scam_calls}


@app.route("/api/get_transcript/<call_id>", methods=["GET"])
def get_transcript(call_id):
    db, cursor = get_db()
    call = cursor.execute("SELECT transcript, status FROM calls WHERE id = ?", [call_id]).fetchone()
    transcript, status = call.get("transcript"), call.get("status")
    db.close()
    return {"status": "ok", "transcript": transcript, "call_status": status}


app.run()
