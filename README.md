## README - AWS Elastic Beanstalk Deployment Guide

## Creative Website - Node.js Application

This is a full-featured Node.js web application with a creative, responsive website interface, designed to be deployed on AWS Elastic Beanstalk using AWS CodeDeploy.

### Project Structure

```
.
├── app.js                          # Main Express.js server
├── package.json                    # Node.js dependencies
├── appspec.yml                     # CodeDeploy configuration
├── public/
│   └── index.html                  # Creative website UI
├── scripts/
│   ├── install_dependencies.sh     # Dependency installation
│   ├── start_server.sh             # Server startup
│   ├── stop_server.sh              # Server shutdown
│   └── validate_service.sh         # Service health check
└── .ebextensions/
    ├── nodejs.config               # Elastic Beanstalk Node.js config
    └── alb-rules.config            # Load balancer configuration
```

### Features

- ✨ Modern, responsive design
- ⚡ Express.js web server
- 📊 Health check and info API endpoints
- 🔄 Auto-scaling ready
- 🛡️ Production-ready configuration
- 📱 Mobile-friendly interface

### Local Development

1. Install dependencies:
   ```bash
   npm install
   ```

2. Start the server:
   ```bash
   npm start
   ```

3. Open browser to `http://localhost:8081`

### Deployment to AWS Elastic Beanstalk

#### Option 1: Using AWS Console

1. Create a new Elastic Beanstalk environment
2. Choose Node.js platform
3. Upload the application ZIP (all files in root directory)
4. Configure environment variables
5. Deploy

#### Option 2: Using AWS CLI

```bash
# Initialize Elastic Beanstalk
eb init -p "node.js 18 running on 64bit Amazon Linux 2" my-app

# Create environment
eb create my-env

# Deploy
eb deploy
```

#### Option 3: Using CodeDeploy

1. Push code to CodeCommit or GitHub
2. Create a CodeDeploy application
3. Configure deployment group
4. CodeDeploy will use appspec.yml for deployment

### Environment Variables

Set these in Elastic Beanstalk environment configuration:

- `NODE_ENV`: Set to `production`
- `PORT`: Usually 8081 (handled by Elastic Beanstalk)

### API Endpoints

- `GET /` - Serves the main website
- `GET /health` - Health check endpoint
- `GET /api/info` - Server information

Example:
```bash
curl http://your-domain/health
```

Response:
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

### Troubleshooting

#### Application won't start
- Check `/var/log/eb-engine.log` on EC2 instance
- Verify Node.js and npm are installed
- Check that all dependencies are listed in package.json

#### Health checks failing
- Ensure port 8081 is not blocked
- Verify `/health` endpoint is accessible
- Check security group rules

#### Deployment fails
- Verify appspec.yml syntax is correct
- Check that all scripts have execute permissions
- Review CodeDeploy logs in AWS Console

### Performance Optimization

- Enable gzip compression (configured in .ebextensions)
- Use CloudFront CDN for static assets
- Enable RDS read replicas for scaling database
- Configure auto-scaling policies

### Monitoring

Monitor your application in AWS Console:
- Elastic Beanstalk Dashboard
- CloudWatch Logs
- CloudWatch Metrics
- X-Ray (for distributed tracing)

### Security Best Practices

1. Use AWS Systems Manager Parameter Store for secrets
2. Enable HTTPS with ACM certificates
3. Configure security groups properly
4. Enable Elastic Beanstalk monitoring
5. Use IAM roles for application permissions

### Further Reading

1. Customize the website in `public/index.html`
2. Add more API endpoints in `app.js`
3. Add a database connection (RDS)
4. Set up CI/CD pipeline with CodePipeline
5. Configure custom domain with Route 53

---

**Built for AWS Elastic Beanstalk | Deployed via CodeDeploy | Node.js Runtime**
