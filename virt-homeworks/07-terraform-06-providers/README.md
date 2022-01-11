## Домашнее задание к занятию "7.6. Написание собственных провайдеров для Terraform."

1. Все доступные `resource` и `data_source` перечислены в файле **https://github.com/hashicorp/terraform-provider-aws/blob/b8198c1d4a35bff92a121ebaf4f5cccc9eac39b8/internal/provider/provider.go**

2. 
* Параметр `name` конфликтует с параметром `name_prefix`
```
        "name": {
            Type:          schema.TypeString,
            Optional:      true,
            Computed:      true,
            ForceNew:      true,
            ConflictsWith: []string{"name_prefix"},
        }
```
в файле: **https://github.com/hashicorp/terraform-provider-aws/blob/b8198c1d4a35bff92a121ebaf4f5cccc9eac39b8/internal/service/sqs/queue.go**
* Имя может содержать до 80 символов.
* Имя подчиняется следующему регулярному выражению если тип FIFO:  
`^[a-zA-Z0-9_-]{1,75}\.fifo$`  
или Standard:  
`^[a-zA-Z0-9_-]{1,80}$`
