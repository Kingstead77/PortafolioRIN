import os
import glob

def main():
    pngs = sorted(glob.glob("*.png"))
    if not pngs:
        print("No se encontraron archivos .png en la carpeta actual.")
        return

    print(f"Se encontraron {len(pngs)} imágenes. Se renombrarán como 2.1.png, 2.2.png, ...")
    for i, old in enumerate(pngs, start=1):
        new = f"6.{i}.png"
        os.rename(old, new)
        print(f"  {old} -> {new}")

if __name__ == "__main__":
    main()
