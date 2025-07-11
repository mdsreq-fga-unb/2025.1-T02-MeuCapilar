# 🧪 Testando a Funcionalidade de Upload de Imagens

## 🎯 Para Testar a Funcionalidade

### 1. Acessar o Sistema
```
http://localhost:3000
```

### 2. Login como Terapeuta
- **Email:** terapeuta@meucapilar.com
- **Senha:** 123456

### 3. Criar um Novo Registro Clínico com Imagens

1. Acesse **"Registros Clínicos"** no menu
2. Clique em **"Novo Registro"**
3. Preencha os campos obrigatórios:
   - **Paciente:** Selecione um paciente
   - **Tipo de Registro:** Escolha qualquer tipo
   - **Queixa Principal:** Digite algo como "Teste de upload de imagens"
   - **Diagnóstico/Avaliação:** Digite algo como "Testando funcionalidade de imagens BMP"

4. **Na seção "Imagens do Registro":**
   - Clique em **"Carregar imagens"** ou arraste arquivos
   - Selecione arquivos BMP (até 10 arquivos, máximo 5MB cada)
   - Veja o preview dos arquivos selecionados
   - Validação automática do formato

5. Clique em **"Salvar Registro"**

### 4. Verificar as Funcionalidades

#### Na Listagem de Registros:
- ✅ Ícone verde de imagem aparece na coluna "Imagens"
- ✅ Contador mostra quantas imagens tem o registro

#### Na Página de Detalhes:
- ✅ Galeria de imagens é exibida
- ✅ Clique em qualquer imagem abre o modal
- ✅ Modal permite visualização em tela cheia
- ✅ Botão de download funciona
- ✅ Tecla ESC fecha o modal

#### Na Edição:
- ✅ Imagens existentes são mostradas
- ✅ Possível adicionar mais imagens
- ✅ Contador atualizado (X/10 imagens)

## 🖼️ Criando Arquivos BMP para Teste

### Opção 1: Converter Imagens Online
1. Acesse: https://convertio.co/jpg-bmp/
2. Faça upload de qualquer JPG/PNG
3. Converta para BMP
4. Baixe os arquivos convertidos

### Opção 2: Usando Paint (Windows)
1. Abra o Paint
2. Crie uma imagem simples
3. Salve como → BMP

### Opção 3: Usando GIMP (Linux/Mac/Windows)
1. Abra o GIMP
2. Crie nova imagem
3. Exporte como → BMP

## 🔍 Pontos a Validar

### ✅ Validações Funcionando:
- Apenas arquivos BMP são aceitos
- Máximo 10 imagens por registro
- Máximo 5MB por arquivo
- Mensagens de erro apropriadas

### ✅ Interface Responsiva:
- Teste em desktop, tablet e mobile
- Galeria se adapta ao tamanho da tela
- Modal funciona em todos os dispositivos

### ✅ Performance:
- Upload rápido de múltiplas imagens
- Carregamento suave da galeria
- Modal abre instantaneamente

## 🚨 Possíveis Problemas e Soluções

### Se imagens não aparecem:
```bash
# Verificar configuração Active Storage
sudo docker-compose exec web bin/rails console
ActiveStorage::Blob.count
```

### Se upload falha:
- Verificar formato BMP
- Verificar tamanho do arquivo (< 5MB)
- Verificar total de imagens (< 10)

### Se modal não abre:
- Verificar console do navegador
- Verificar JavaScript está funcionando
- Limpar cache do navegador

## 📋 Checklist de Teste Completo

- [ ] Login no sistema
- [ ] Criar novo registro com imagens
- [ ] Verificar validação de formato
- [ ] Verificar limite de arquivos
- [ ] Verificar galeria na visualização
- [ ] Testar modal de imagem
- [ ] Testar download de imagem
- [ ] Editar registro e adicionar mais imagens
- [ ] Verificar indicador na listagem
- [ ] Testar responsividade em mobile

**Status: PRONTO PARA TESTE** ✅ 