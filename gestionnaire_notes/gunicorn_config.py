from multiprocessing import cpu_count

bind = "127.0.0.1:8000"  # Adresse IP et port sur lesquels Gunicorn écoute les connexions
workers = cpu_count() * 2 + 1  # Nombre de processus de travail Gunicorn
