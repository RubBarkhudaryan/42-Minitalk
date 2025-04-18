# Inside generate_text.py
import lorem, random

emojis = ["😊", "🚀", "🔥", "🎉", "💡", "💻", "📚", "🧠", "🌟", "✨"]
text = lorem.paragraph() * 10
words = text.split()

print(" ".join([
    word + random.choice(emojis) if random.random() < 0.3 else ""
    for word in words
]))
