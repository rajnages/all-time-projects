Command	         Description
pulumi new	     Creates a new Pulumi project. Example: pulumi new aws-python initializes an AWS project with Python.
pulumi login	 Logs into Pulumi's backend to store the state (e.g., Pulumi Cloud, S3, local).
pulumi whoami	 Displays the currently logged-in Pulumi user or organization.
pulumi logout	 Logs out from the current backend.
pulumi config	 Manages configuration values for the project. Example: pulumi config set key value.
pulumi up	     Provisions or updates resources as defined in the Pulumi program.
pulumi preview	 Simulates changes that pulumi up would make, without actually making any changes.
pulumi refresh	 Updates Pulumi’s state with the current state of your cloud resources.