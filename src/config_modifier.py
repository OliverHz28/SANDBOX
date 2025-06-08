import json
import os

def leer_json(file_path):

    if not os.path.exists(file_path):
        raise FileNotFoundError(f"No existe el archivo '{file_path}'")
    
    with open(file_path, 'r', encoding='utf-8') as f:
        try:
            return json.load(f)
        except json.JSONDecodeError:
            raise ValueError(f"El archivo '{file_path}' no contiene un JSON válido")