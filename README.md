# Script-Runner for deployments to Kubernetes with Camunda

This web application accepts a post request from Camunda with the required informations to deploy a Service to Kubernetes through a shell script on the host.

Install requirements with:

```bash
pip install -r requirements.txt
```

Run application with:

```python
flask run --host=0.0.0.0 -p 3000
```