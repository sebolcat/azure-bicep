# BICEP configuration

## Required Package
- Azure CLI
- Azure BICEP

### Install Azure CLI
```
az --version
az upgrade --all true
``` 

### Install BICEP
```
%USERPROFILE%\.Azure\bin>bicep.exe --version
```

#### If there is an errors with bicep deployment
- Remove bicep.exe from `%USERPROFILE%\.Azure\bin`
- Reinstall bicep `az bicep upgrade`
