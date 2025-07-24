# remote-state

This module is needed to, initially, create an S3 bucket for state management.

The module will ask for the name of the S3 bucket, which needs to be unique as S3 is a global namespace. The default region is eu-central-1, but you can change this by setting the `region` variable.
