# Demonstration of the WebApp
![NYwebsite](https://user-images.githubusercontent.com/110972992/190180095-401a6e85-128f-4419-aa43-e46fb5487dd9.png)

![Londonwebapp](https://user-images.githubusercontent.com/110972992/190180638-8bad0a6d-ef33-4903-bde4-a77e7e376735.png)

Websites are up and working as they should.

![traffic manager](https://user-images.githubusercontent.com/110972992/190188628-06628931-f293-433f-91c1-087b0a4ddd61.png)

Traffic manager redirects to one of the websites.

Now we need to test if the traffic manager redirects as it is supposed to do. Since the website is hosted from the same Github repo and the website looks identical we cannot tell which website we get connected to. Another option is to use "nslookup" to check where we get redirected.

![traffic manager test](https://user-images.githubusercontent.com/110972992/190195342-beb9b73e-f4e4-453f-b873-b7bc05a02a09.png)


For the first connection we are connecting from Norway and we get redirected the London website as we should.

For the second we are connecting from US with a VPN service and we get redirected to the NY website.

Success!
