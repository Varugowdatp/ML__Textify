# 🤖 ML_Textify – Extract Text from Images with AI

**ML_Textify** is a powerful Flutter application that uses **Machine Learning (OCR)** to extract readable text from images. Users can **copy the extracted text**, **export it as a text or PDF file**, or **share it directly**. Designed for productivity, study, and quick digitization of printed content.

---

## 📌 Features

- 📷 **Image to Text (OCR)** – Select or capture an image and extract text instantly using ML.
- 📄 **Export Options**:
  - Copy to clipboard
  - Save as `.txt` file
  - Export as `.pdf`
  - Share via messaging apps or email
- 🖼️ **Multiple Image Support** *(optional enhancement)*
- 🧠 **Text Cleanup** *(optional)* – Auto-format and clean extracted text.
- 🧾 **Text History** *(optional)* – View and manage previously extracted text.
- 🎨 **Modern UI** – Minimal, clean, and responsive Flutter UI.

---

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **ML OCR Engine**: Firebase ML Vision / Google ML Kit (on-device)
- **Storage**: Firebase (for future cloud sync) or local device storage
- **PDF/Text Export**: `pdf`, `path_provider`, `share_plus` packages

---

## 🚀 Getting Started

### 🔧 Prerequisites

- Flutter SDK installed
- Firebase project set up (if using Firebase ML Kit)
- Android Studio or VS Code
- Internet (only needed for Firebase setup)

---

### ⚙️ Installation

1. **Clone the Repository**

``bash
git clone https://github.com/yourusername/ML_Textify.git
cd ML_Textify

*** Snapshots of project 
* Home Screen *
 
![Screenshot 2025-04-09 131912](https://github.com/user-attachments/assets/0b83af21-3c70-42bb-be19-96a04941638e)
* Image Picking Screen *
  
![Screenshot 2025-04-09 131937](https://github.com/user-attachments/assets/354ac416-16dc-40d8-a3f2-bd967175c467)
* Sharing a image  *

![Screenshot 2025-04-09 132248](https://github.com/user-attachments/assets/53fe95a6-56c2-498e-b4e3-bde0e9d8fbc2)
![Screenshot 2025-04-09 132234](https://github.com/user-attachments/assets/bee9165f-2b29-4053-a673-3e9914ef2185)
* Image Enhancement *
  
![Screenshot 2025-04-09 132144](https://github.com/user-attachments/assets/195b008d-afa1-4c26-b87d-f112de29c219)

*Text Recognition and exporting those in a PDF and Text File Format *

![Screenshot 2025-04-09 132040](https://github.com/user-attachments/assets/6b01828b-5560-4e50-a79f-ba6f05489f11)
![Screenshot 2025-04-09 132020](https://github.com/user-attachments/assets/b60e0e8f-f912-48e3-9f0f-beba4ffd48d5)
 
