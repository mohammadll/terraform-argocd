# Terraform-Argocd
## Creating argocd resources using terraform

![Terraform Image](terraform.png)

## What kind of resources are we going to create?
- Argocd Applications
   - without sync policies & sync options :white_check_mark:
   - with sync policies & sync options :white_check_mark:
- Argocd Projects :white_check_mark:
- Argocd Private Repositories :white_check_mark:
- Argocd Clusters :white_check_mark:
- Argocd Applicationsets
   - cluster generator :white_check_mark:
   - list generator :white_check_mark:
   - git generator (directories subtype) :white_check_mark:
   - git generator (files subtype) :white_check_mark:
   - matrix generator :white_large_square:
   - merge generator :white_large_square:
