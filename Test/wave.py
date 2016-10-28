import math
# Tree structure!
def wave(lista):
    #ave = []
    #diff = []
    # with 2**n numbers in the list, do the transforme n times
    for n in range(0, int(math.log(len(lista),2))):
        for i in range(0, math.floor((len(lista))/2**(n+1))):
            lista[2**(n+1)*i+2**n] = lista[2**(n+1)*i+2**n]-lista[2**(n+1)*i]
            lista[2**(n+1)*i] = lista[2**(n+1)*i]+lista[2**(n+1)*i+2**n]/2
            #diff.append(lista[2**(n+1)*i+2**n])
            #ave.append(lista[2**(n+1)*i])
        #print("Ave: ",ave)
        #print("Diff: ",diff)
        #ave = []
        #diff = []
        print(lista)
    return lista

def unwave(lista):
    for n in range(int(math.log(len(lista),2))-1, -1, -1):
        for i in range(0, math.floor((len(lista))/2**(n+1))):
            lista[2**(n+1)*i] = lista[2**(n+1)*i] - lista[2**(n+1)*i+2**n]/2
            lista[2**(n+1)*i+2**n] = lista[2**(n+1)*i+2**n] + lista[2**(n+1)*i]
        print(lista)
    return lista

coeff = [8.0, 4.0, 1.0, 3.0, 5.0, 2.0, 3.0, 4.0]
print(coeff)
print("Waving")
wave(coeff)
print("Unwaving")
unwave(coeff)

