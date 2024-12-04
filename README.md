# tech_challenge_terraform_rds

1. Fazer o download e instalção do AWS CLI https://aws.amazon.com/pt/cli/

2. Fazer o download e instalação do terraform: https://www.terraform.io/

3. Criar o usuário no AWS IAM

3. Inserir as credencias no arquivo terraform.tfvars

4. Executar a sequência de comandos na raiz do projeto:

	terraform init	 (Apenas se adicionou/alterou provedores ou módulos)
	
	terraform validate	 (Opcional, para checar o código)
	
	terraform plan	 (Sempre antes de apply para revisar as mudanças)
	
	terraform apply	 (Sempre para implementar as alterações)