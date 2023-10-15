# Terraform-Argocd
## Creating argocd resources using terraform

![Terraform Image](terraform.png)

## What kind of resources are we going to create?
- Argocd applications
   - without sync policies & sync options :white_check_mark:
   - with sync policies & sync options :white_check_mark:
- Argocd projects :white_check_mark:
- Argocd private repositories :white_check_mark:
- Argocd clusters :white_check_mark:
- Argocd applicationsets
   - cluster generator :white_check_mark:
   - list generator :white_check_mark:
   - git generator (directories subtype) :white_check_mark:
   - git generator (files subtype) :white_check_mark:
   - matrix generator :white_large_square:
   - merge generator :white_large_square:
