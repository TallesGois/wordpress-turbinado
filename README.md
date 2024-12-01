# WordPress Turbinado na AWS com Monitoramento

Este projeto demonstra como configurar um ambiente WordPress otimizado na AWS utilizando práticas modernas de infraestrutura como código (IaC) com Terraform, Ansible e ferramentas de monitoramento como Prometheus e Grafana.

---

## Estrutura do Projeto

1. **Infraestrutura**:
   - **Terraform**:
     - Provisionamento de recursos AWS, como:
       - Instâncias EC2 com Ubuntu Server 20.04.
       - VPC, Subnets, e Security Groups.
       - Balanceador de carga e chave SSH.
   - Arquivo de configuração principal: `ec2.tf`.

2. **Automação de Configuração**:
   - **Ansible**:
     - Configuração do ambiente EC2:
       - Instalação e configuração do WordPress.
       - Configuração do PHP, Nginx e MySQL.
       - Implantação de plugins e ajustes de permissões.

3. **Monitoramento e Observabilidade**:
   - **Prometheus**:
     - Coleta de métricas do sistema (via Node Exporter).
   - **Grafana**:
     - Painéis de monitoramento para:
       - Recursos do sistema: CPU, memória, disco.
       - "Four Golden Signals": latência, tráfego, erros e saturação..

---

## Passos Realizados

### 1. **Provisionamento da Infraestrutura**
- Utilizado Terraform para criar duas instâncias EC2 (em zonas de disponibilidade diferentes) utilizando o Ubuntu Server 20.04.
- Configurado chaves SSH e Security Groups para acesso e segurança da aplicação.

### 2. **Configuração do Ambiente**
- Usando Ansible, instalei e configurei:
  - Nginx como servidor web.
  - PHP e extensões necessárias para WordPress.
  - MySQL para o banco de dados do WordPress.

### 3. **Monitoramento com Prometheus e Grafana**
- **Prometheus**:
  - Instalado em uma das instâncias EC2.
  - Configurado para coletar métricas do Node Exporter e do WordPress.
- **Grafana**:
  - Configurado com Prometheus como data source.
  - Criado painel customizado para monitorar métricas do sistema e do WordPress.

---

## Ferramentas Utilizadas

- **Terraform**: Provisionamento da infraestrutura.
- **Ansible**: Automação da configuração do ambiente.
- **Prometheus**: Coleta de métricas.
- **Grafana**: Visualização de métricas.
- **Node Exporter**: Métricas do sistema operacional.
- **PromPress**: Métricas do WordPress integradas ao Prometheus.

---

## Resultados

- Ambiente WordPress totalmente funcional e monitorado.
- Painéis no Grafana trazendo dados em tempo real sobre:
  - Utilização de recursos do servidor.
  - Saúde do WordPress (via PromPress).

---

## Melhorias Futuras

1. Configuração de backup automático do banco de dados e arquivos.
2. Configurar arquitetura elástica com VMs e autoscaling.
3. Configurar repositório de sessões Memcached em outro servidor.
4. Configurar armazenamento de arquivos escalável e elástico(EFS).
5. Arquitetura com CDN/WAF na frente do wordpress.