import os
with open("C:/Users/Le Quang Minh/.gemini/antigravity/brain/3dedfcdd-ee47-4bad-bf21-1e4bf5f22064/task.md", 'r') as f:
    text = f.read()
text = text.replace("- [ ] Add JS polling/realtime logic to `booking.jsp`", "- [x] Add JS polling/realtime logic to `booking.jsp`")
text = text.replace("- [ ] Guide user on Bank info & ngrok setup", "- [x] Guide user on Bank info & ngrok setup")
with open("C:/Users/Le Quang Minh/.gemini/antigravity/brain/3dedfcdd-ee47-4bad-bf21-1e4bf5f22064/task.md", 'w') as f:
    f.write(text)
