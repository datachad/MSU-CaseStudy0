# MSU-CaseStudy0
Microsoft University 2022 - Azure Cloud Platform - Case Study 0

This is our solution to one of the case studies for Cloud Platform MSU 2022. Below this text is a visual representation of our solution. 
The solution is also documented as code, and redeployable through Terraform.

## User Accounts
3 admin accounts were needed for Contoso Coffe. Bob, Dave, and Mark. The case described the acces they needed. Below is a diagram depicting roles and scope assigned. 

Bob is the owner of Contoso Coffe and is assigned the "Global administrator" role in Azure AD. 

Dave is administrating the website. He is assigned the "Contributor" role to the resource group that contains the website. This is to ensure that he only has access to what he needs to work with the website. 

Mark only requires read access to the resource, hence why he is only assigned the "Reader" role. 

![image](https://user-images.githubusercontent.com/105489708/190192834-771e9cfc-3e54-44e3-a6a5-dc3b61acf19d.png)


## Website Hosting
We chose the difficulty level 1, where we host the website from a GitHub repository. Contoso Coffee needs to be in both New York and London, so we utilized Traffic manager as our solution for proper regional routing. Traffic manager was set in performance mode. This made the traffic automatically route based on location / performance of the website, reducing latency, and providing the local page needed. 

![image](https://user-images.githubusercontent.com/105489708/190180360-df9dcee8-3ad7-430e-aad0-43256a9a3621.png)



## Contoso Storage 

Large amounts of images are needed for Contoso to display them on screens in store. These images should also be able to auto archive. 

A solution to this was to create a storage account with a blob container within it. 
SAS keys are enabled when using blob containers, an easy way to give developers access to what they need, within time limits. 
For archiving purposes we enabled lifecycle management, and made files that have not been modified for 30 days, archive itself. 

![image](https://user-images.githubusercontent.com/105489708/190183732-cb93f8f6-0556-4158-b902-09fc7479b90f.png)
