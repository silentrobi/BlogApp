# Blog backend application
Blog backend application is developed using **micro service** architecture. The project has four micro services, these are **Api Gateway**, **Identity Server**, **BlogApi Server** and **Notification Server**.

## Backend architecture
![Alt Text](https://dev-to-uploads.s3.amazonaws.com/i/xn4xul2vfqd3ok8l0a4g.jpg)

## How the project is structured?
Each micro service has its own repository. You can reach the repositories from here:
- [API Gateway](https://github.com/silentrobi/Blog.ApiGateway.Ocelot)
- [Identity Server](https://github.com/silentrobi/Blog.Service.Identity)
- [Blog Api Server](https://github.com/silentrobi/Blog.Service.BlogApi)
- [Notification Server](https://github.com/silentrobi/Blog.Service.Notification)

The `BlogApp` repository has two main folders, one is `composes` and another is `scripts`.
- `composes` folder has `docker-compose` files for micro services and common services like postgresql, rabbitmq etc.
- `scripts` folder has `git-clone.sh` that clones above repositories and `compile.sh`.

## How to start the project?
- Run the `compile.sh` script file under the folder `BlogApp/scripts`.  This will clone all the repositories, build and run them as docker containers. This will also build and run common services defined in `infrastructure.yml` file under `BlogApp/composes` folder .
- Visit `http://localhost:5000` from your browser and you will get `hello world` message.

## **Important Notes** 
Before you run `compile.sh`, you have make some changes on **Blog.Service.Notification** project. Go to `Blog.Service.Notification/Blog.Service.Notification.Application/appsettings.json` file. Change `EmailConfiguration` setting to your own setting. Also create an environment variable named `EMAIL_PASSWORD` where you can store your email password.

## Indentity Server Endpoints
**Register New User:** 
```
curl --location --request POST 'http://localhost:5000/api/identity/v1/users/register' \
--header 'Content-Type: application/json' \
--data-raw '{
  "phoneNumber": "5656688087",
  "password": "xxxxxxxx",
  "email": "silentrobi840@gmail.com",
  "userName": "robi"
}'
```
**User Authentication:** 
```
curl --location --request POST 'http://localhost:5000/api/identity/connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=blogapp' \
--data-urlencode 'client_secret=xxxxxxxxxxxxxxxxxxxxxxxx' \
--data-urlencode 'scope=blogapi.read profile' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=silentrobi840@gmail.com' \
--data-urlencode 'password=xxxxxxxxx' \
--data-urlencode 'resposne_type=token'
```
**Test Token Verification:**
```
curl --location --request GET 'http://localhost:5000/api/identity/api/v1/test' \
--header 'Authorization: Bearer xxxxxxxxxxxxxxxxxxx......'
```
