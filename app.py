from flask import Flask, render_template, redirect
from database import get_db

app = Flask(__name__)

@app.route("/")
def index():
    return redirect("/home")

@app.route("/home", methods=["GET", "POST"])
def render_home():
    db = get_db()
    cursor = db.execute("SELECT DISTINCT subject.name, subject.id FROM grade JOIN subject ON grade.subject = subject.id")
    subjects = cursor.fetchall()

    for subject in subjects:
        cursor2 = db.execute(f"""SELECT * FROM grade WHERE subject = "{subject["id"]}" """)
        grades = cursor2.fetchall()
        subject["grades"] = grades

    return render_template("home.html", subjects=subjects)

@app.route("/home/edit", methods=["GET", "POST"])
def render_grade_edit():
    db = get_db()
    subjects = db.execute("SELECT name FROM subject").fetchall()
    trimesters = db.execute("SELECT number FROM trimester").fetchall()

    return render_template("grades_edit.html", subjects=subjects, trimesters=trimesters)
