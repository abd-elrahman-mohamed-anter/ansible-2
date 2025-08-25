# Ansible SSH Configuration

This project demonstrates how to configure SSH for passwordless access between machines and use Ansible to manage them.

---

## 1. ansible-installation

Install **Ansible** on your **control node** (the main machine).  

### On Debian/Ubuntu:
```bash
sudo apt update
sudo apt install ansible -y
```

### On RedHat/CentOS:
```bash
sudo yum install epel-release -y
sudo yum install ansible -y
```

### Verify installation:
```bash
ansible --version
```

---

## 2. keygen

Generate SSH keys on your **control node**:

```bash
ssh-keygen
```

- When asked for "passphrase" → just press **Enter**.
- Generated files:
  - `~/.ssh/id_rsa` → private key  
  - `~/.ssh/id_rsa.pub` → public key  

---

## 3. copy-id-for-abdoomo

Copy your public key to the host with user **abdoomo**:

```bash
ssh-copy-id abdoomo@192.168.125.131
```

---

## 4. copy-id-for-ahmed

Copy your public key to the host with user **ahmed**:

```bash
ssh-copy-id ahmed@192.168.125.130
```

---

## 5. cat-hosts

Create the inventory file `hosts.ini` and list your machines:  

```ini
[vm]
debian1 ansible_host=192.168.125.131 ansible_user=abdoomo
debian-cloned ansible_host=192.168.125.130 ansible_user=ahmed
```

---

## 6. ansible-ping-on-debian1

Ping only the host **debian1** to test Ansible connection:  

```bash
ansible -i hosts.ini debian1 -m ping
```

---

## 7. ping-on-2-machines

Ping **all machines** inside the group `vm` to test Ansible connection:  

```bash
ansible -i hosts.ini vm -m ping
```

If everything is set up correctly, you should see **SUCCESS** for both hosts.  

---

