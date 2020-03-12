# Ambassador

> Cloud Native API Gateway. More info [here](https://www.getambassador.io/).

##### 

#### Requirements

##### Tools

* terraform
* kubectl
* edgectl
* jq
* sed


##### Other

* Google Cloud Service Account for terraform on the target project


#### Steps
    
    # Load infrastructure.
        
    $ terraform init
    $ terraform plan
    $ terraform apply

    # connect to the cluster that was created
    $ gcloud container clusters get-credentials <cluster-name>--zone <zone-a>--project <project-name>
    
    $ sh install.sh
    
    # NOTE: it may fail due to certbot giving certificate to a domain out of the scope of our organization ( e.g: https://awesome-faraday-3778.edgestack.me) try again if this is the case
    $ edgectl install
​     