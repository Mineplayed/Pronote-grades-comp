from database import get_db
from app import app

with app.app_context():
    db = get_db()
    with open('schema.sql', encoding="utf-8") as f:
        db.executescript(f.read())