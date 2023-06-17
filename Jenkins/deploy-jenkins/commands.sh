docker-compose up -d

# docker run -p 8080:8080 -p 50000:50000 -v /home/jenkins/jenkins:/var/jenkins_home sujeetkp/jenkins

# Run docker compose to create jenkins and ssh agent
# Configure the Agent in "Manage Jenkins" (Use SSH Keys) ("/var/jenkins_home")
# Create Github PAT token
# Add a user in Jenkins to connect to git. (Username is "git", Password is github PAT)
