import os
with open("C:/Users/Le Quang Minh/.gemini/antigravity/brain/3dedfcdd-ee47-4bad-bf21-1e4bf5f22064/task.md", 'r') as f:
    text = f.read()
text = text.replace("- [ ] Create `SepayWebhookServlet.java` to auto-approve orders", "- [x] Create `SepayWebhookServlet.java` to auto-approve orders")
with open("C:/Users/Le Quang Minh/.gemini/antigravity/brain/3dedfcdd-ee47-4bad-bf21-1e4bf5f22064/task.md", 'w') as f:
    f.write(text)
