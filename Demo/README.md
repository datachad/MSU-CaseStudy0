# Demonstration of the WebApp
![NYwebsite](https://user-images.githubusercontent.com/110972992/190180095-401a6e85-128f-4419-aa43-e46fb5487dd9.png)

![Londonwebapp](https://user-images.githubusercontent.com/110972992/190180638-8bad0a6d-ef33-4903-bde4-a77e7e376735.png)

Websites are up and working as they should.

![traffic manager](https://user-images.githubusercontent.com/110972992/190188628-06628931-f293-433f-91c1-087b0a4ddd61.png)

Traffic manager redirects to one of the websites.

Now we need to test if the traffic manager redirects as it is supposed to do. Since the website is hosted from the same Github repo and the website looks identical we can use "nslookup" to check where we get redirected.
![traffic manager test](https://user-images.githubusercontent.com/110972992/190191875-4a19c1b5-9303-4f96-bf54-2e1786ce8b3b.png)

For the first connection we are connecting from Norway and we get redirected the london website as we should.

For the second we are connecting from US with a VPN service and we get redirected to the NY website.

Success!
