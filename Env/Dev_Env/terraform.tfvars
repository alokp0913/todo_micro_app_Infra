rginfo = {
  rg1 = {
    resource_group_name = "demorg001"
    location            = "North Europe"
    tags = {
      created_by = "Alok"
      managed_by = "terraform"
    }
  }
}
##------------------------Vnet_info_Tfvars-----------------------##
vnet_info = {
  vnet1 = {

    vnet_name           = "demovnet001"
    location            = "North Europe"
    resource_group_name = "demorg001"
    vnet_cidr           = ["10.10.10.0/24"]

    tags = {
      created_by = "Alok"
      managed_by = "terraform"
    }

    subnet_info = {
      subnet1 = {
        subnet_name = "demo_subnet001"
        subnet_cidr = ["10.10.10.0/26"]
      }
      subnet2 = {
        subnet_name = "demo_subnet002"
        subnet_cidr = ["10.10.10.64/26"]
      }
    }

  }
}


##------------------Public_ip_info_Tfvars---------------------##

pip_info = {
  pip1 = {

    pip_name            = "demopublic_ip-001"
    location            = "North Europe"
    resource_group_name = "demorg001"
    allocation_method   = "Static"
    tags = {
      created_by = "Alok"
      managed_by = "terraform"
    }

  }
}


##------------SQL_Server_-------------------##

sql_server = {

  sql_server1 = {

    sql_server_name              = "demosql-server001"
    location                     = "North Europe"
    resource_group_name          = "demorg001"
    version                      = "12.0"
    user_mi_name                 = "alokmi001"
    administrator_login          = "cloud-user"
    administrator_login_password = "Aakoko@#0913"
    minimum_tls_version          = "1.2"
    identity_name                = "UserAssigned"

  }
}



##-----------SQL_DataBase_---------##


sql_db = {

  db1 = {
    sqldb_name          = "mydemodb001"
    sql_server_name     = "demosql-server001"
    location            = "North Europe"
    resource_group_name = "demorg001"
    max_size_gb         = 2
    tags = {
      created_by = "Alok"
      managed_by = "terraform"
    }


  }



}


##-----------------ACR_----------------##


acr = {
  azurecr1 = {

    acr_name            = "mydemoacr0001"
    location            = "North Europe"
    resource_group_name = "demorg001"
    tags = {
      created_by = "Alok"
      managed_by = "terraform"
    }





  }
}



##---------------------AKS-----------------------##

aks = {
  aks1 = {
    aks_name            = "mydemoaks001"
    acr_name            = "mydemoacr0001"
    location            = "North Europe"
    resource_group_name = "demorg001"
    nodepool = {
      node1 = {
        pool_name  = "poolmy001"
        node_count = 1
      }


    }

  }
}

