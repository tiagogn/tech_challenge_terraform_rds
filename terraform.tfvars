aws_access_key = "${{ secrets.AWS_ACCESS_KEY }}" # Inserir chave de acesso do usuário criado no IAM
aws_secret_key = "${{ secrets.AWS_SECRET_KEY }}" # Inserir chave de acesso secreta do usuário criado no IAM
region         = "us-east-1"
db_name        = "lanchonete"
db_username    = "${{ secrets.DB_USERNAME }}"
db_password    = "${{ secrets.DB_PASSWORD }}"