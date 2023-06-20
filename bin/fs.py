#!/home/hdayi/.nix-profile/bin/python

import os

TMUX = os.getenv('TMUX')


class MySession:
    def __init__(self, name, isAttached) -> None:
        self.name = name
        if(name == "hdMain"):
            self.other = "hdDev"
        elif(name == "hdDev"):
            self.other = "hdMain"

        self.isAttached = isAttached

    def create(self):
        if(self.isAttached):
            komut = 'tmux new -s ' + self.other
            os.system(komut)
        else:
            komut = ' tmux attach -t "'+self.name+'"'
            os.system(komut)
        pass

    def attach(self):
        komut = ' tmux attach -t "'+self.name+'"'
        os.system(komut)

    name = ''
    other = ''
    isAttached = False


if(type(TMUX) != str):

    sesList = []

    stream = os.popen(
        'tmux ls 2>/dev/null -F "#{session_name} #{?session_attached,OK:,NO:}"')
    sonuc = stream.read()
    liste = sonuc.split(':')
    for st in liste:
        if(len(st) > 5):
            cl = st.split()
            isIt = True if cl[1] == 'OK' else False
            myS = MySession(cl[0], isIt)
            sesList.append(myS)

    if(len(sesList) == 0):
        # liste boş Main'e bağlan yani hiç session yok
        os.system('tmux new -s hdMain')

    elif(len(sesList) == 1):
        # Hangisinie bağlı değilsek ona bağlan
        ses = sesList[0]
        ses.create()

    elif(len(sesList) == 2):
        # bakalım bağlı olmadığımız var mı?
        for ses in sesList:
            if(ses.isAttached == False):
                ses.attach()
    else:
        # neler oluyor böyle
        print("BÜTÜN HEPSİNE BAĞLIYMIŞIZ MEĞER")
else:
    print("..................................")
