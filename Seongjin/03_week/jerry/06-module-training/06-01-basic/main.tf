terraform { 
  cloud { 
    
    organization = "seongjinlee-study" 

    workspaces { 
      name = "test" 
    } 
  } 
}


resource "random_pet" "name" {
    keepers= {
        ami_id = timestamp()
    }
}
output "mypw1" {
    value = random_pet.name
}

