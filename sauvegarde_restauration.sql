-- Sauvegarde
C:\wamp64\bin\mysql\mysql8.0.24\bin>mysqldump --user=root --password= --databases afpa_gescom > C:\Backup\backup_afpa_gescom.sql

-- Restauration
C:\wamp\bin\mysql\mysql8.0.21\bin>mysql  --user=root --password= --databases gescom_afpa < C:\Backup\backup_afpa_gescom.sql