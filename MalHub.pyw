import tkinter as tk
from tkinter import messagebox, filedialog
import subprocess
import os
import threading

# Define download links
download_links = {
    "Worms.zip": "https://www.dropbox.com/scl/fi/mpudfen9rg69v3wtw2nya/Worm.zip?rlkey=hepqjn7wvdjryuclsdir0zf75&st=hqimza94&dl=1",
    "Trojan.zip": "https://www.dropbox.com/scl/fi/rq4yx0r2o2s8fxy6ycb4x/Trojan.zip?rlkey=hk8iyls0ks9xpn2lsuwdwmc0w&st=q0smyc0l&dl=1",
    "Ransomware.zip": "https://www.dropbox.com/scl/fi/ngeilep7kf7t73qfl5y0l/Ransomware.zip?rlkey=mgorwugbmmicflpwhthkzfqlx&st=ix3gua2e&dl=1",
    "Unknown.zip": "https://www.dropbox.com/scl/fi/ggdv4h3ewybj6esb4ymxz/Unknown.zip?rlkey=gvhmr38p3u5uufs94bxd47q5z&st=cnh0in5t&dl=1",
    "Stealer.zip": "https://www.dropbox.com/scl/fi/8zvlwftmveeg5puqjjj5l/Stealer.zip?rlkey=honi712xovczn9xdxliv60ss1&st=o1lktsvz&dl=1",
    "Spy.zip": "https://www.dropbox.com/scl/fi/oqh85gdogmy4bo8ux1jz7/Spy.zip?rlkey=x9xaj7py8m2uehic9dfl02122&st=4bjdq3n2&dl=1",
    "Backdoor.zip": "https://www.dropbox.com/scl/fi/baernotg36utz20cso0zz/Backdoor.zip?rlkey=gm0wvfrretme5yr8brhebw1zd&st=wkug542o&dl=1",
    "Popular.zip": "https://www.dropbox.com/scl/fi/fe3ttv0z1y6gnyd28hvle/Popular.zip?rlkey=hj1dqlhdj6q1sk61jsgi0z4hf&st=9z8iaqbu&dl=1",
    "Phishing.zip": "https://www.dropbox.com/scl/fi/bb53hwxh9kb2wo7opz8pd/Phishing.zip?rlkey=x8vq4pph1nrosc8xu19o4jz6l&st=1qwqlj5x&dl=1",
}

# Function to download a file
def download_file(file_name):
    url = download_links[file_name]
    
    # Ask the user to select a save directory
    save_dir = filedialog.askdirectory(title="Select Download Directory")
    if not save_dir:
        return  # Exit if no directory is selected
    
    file_path = os.path.join(save_dir, file_name)
    
    try:
        # Run the curl command to download the file
        result = subprocess.run(
            ["curl", "-L", "-o", file_path, url], 
            capture_output=True, text=True
        )
        
        if result.returncode == 0:
            messagebox.showinfo("Success", f"{file_name} downloaded successfully to {save_dir}")
        else:
            messagebox.showerror("Error", f"Download failed:\n{result.stderr}")
    except Exception as e:
        messagebox.showerror("Error", f"An error occurred: {str(e)}")

# Function to handle the download in a separate thread to avoid freezing the GUI
def download_thread(file_name):
    # Display a message to the user
    messagebox.showinfo("Notice", "The download is in progress. The terminal will automatically close once the download is finished.")
    download_file(file_name)

# Create the main GUI window
def create_gui():
    root = tk.Tk()
    root.title("MalHub Downloader")
    root.geometry("400x500")

    # Title Label
    tk.Label(root, text="MalHub Downloader", font=("Helvetica", 16, "bold")).pack(pady=20)

    # Instruction Label
    tk.Label(root, text="Select a file to download:", font=("Helvetica", 12)).pack(pady=10)

    # Create buttons for each file
    for file_name in download_links.keys():
        tk.Button(
            root, 
            text=file_name, 
            command=lambda f=file_name: threading.Thread(target=download_thread, args=(f,)).start(),  # Run in a separate thread
            width=20
        ).pack(pady=5)

    # Run the GUI event loop
    root.mainloop()

# Run the GUI
if __name__ == "__main__":
    create_gui()
