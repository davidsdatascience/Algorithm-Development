︠160b39f9-dd29-40ba-8fc9-d2f29edfcbf1︠
def seifert_to_braid(self):
        #x = self.final()
        sc = self.final()[0]
        regions = self.final()[1]
        pd_code = self.final()[2]
        sign = []
        for i in pd_code:
            if i[1] > i[3]:
                sign.append('-')
            elif i[1] < i[3]:
                sign.append('+')
        print sign
        entering = []
        leaving = []
        for i in range(len(pd_code)):
            t = []
            q = []
            if sign[i] == '-':
                t.append(pd_code[i][0])
                t.append(pd_code[i][3])
                q.append(pd_code[i][1])
                q.append(pd_code[i][2])
            elif sign[i] == '+':
                t.append(pd_code[i][0])
                t.append(pd_code[i][1])
                q.append(pd_code[i][2])
                q.append(pd_code[i][3])
            entering.append(t)
            leaving.append(q)
        print pd_code
        print entering
        print leaving
        #making regions positive
        for i in regions:
            for j in range(len(i)):
                if i[j] < 0:
                    i[j] = (-1)*i[j]
        #finding which sc are same as regions
        #r[0] is the first seifert cirlce and r[1] is the last one
        #which coincides with a region and there are exactly two seifert
        #circles here.
        r = []
        for i in sc:
            for j in regions:
                if set(i) == set(j):
                    r.append(i)
                    break
        #here t stores the crossing information required to check which one
        #is the next
        t = [[None for i in range(2*len(sc[j]))] for j in range(len(sc))]
        for i in range(len(sc)):
            for j in range(len(sc[i])):
                t[i][2*j] = sc[i][j] - 1
                t[i][2*j+1] = sc[i][j] + 1
        #print t
        #here we find the order of the seifert circles
        e = []
        t1 = deepcopy(t)
        a = r[0]
        b = r[1]
        del t[0]
        i = 0
        while True:
            for i in range(len(t)):
                if len(list(set(a).intersection(set(t[i])))) != 0:
                    r = t1.index(t[i])
                    e.append(a)
                    del t[i]
                    a = sc[r]
                    break
            else:
                e.append(b)
                break
        #braid numbering and matching the crossings
        print e
        t = []
        flatentering = [a for b in entering for a in b]
        for i in flatentering:
            for k in e:
                if i in k:
                    t.append(e.index(k))
        print t
        for i in range(len(entering)):
            #if t[2*i] > t[2*i+1]:
            if sign[i] == '-':
                if t[2*i] > t[2*i+1]:
                    a = entering[i][0]
                    entering[i][0] = entering[i][1]
                    entering[i][1] = a
                    b = leaving[i][0]
                    leaving[i][0] = leaving[i][1]
                    leaving[i][1] = b
            #elif sign[i] == '+':
                    #a = entering[i][0]
                    #entering[i][0] = entering[i][1]
                    #entering[i][1] = a
                #elif sign[i] == '+':
                    #a = entering[i][
        print entering
        print leaving
        bn = {}
        for i in range(len(e)):
            bn.update({i + 1 : e[i]})
        print bn
        crossingtoseifert = {}
        for i in bn.iterkeys():
            crossingtoseifert.update({i:[]})
        for i in bn.iterkeys():
            for k in pd_code:
                if len(list(set(bn[i]).intersection(set(k)))) == 2:
                    crossingtoseifert[i].append(k)
        print crossingtoseifert
        crossingtoseifertcp = deepcopy(crossingtoseifert)
        crossingtoseifertsign = {}
        for i in crossingtoseifert.iterkeys():
            crossingtoseifertsign.update({i:[]})
        for i in crossingtoseifert.iterkeys():
            for j in crossingtoseifert[i]:
                if j[1] > j[3]:
                    crossingtoseifertsign[i].append(-1)
                if j[1] < j[3]:
                    crossingtoseifertsign[i].append(1)
        print crossingtoseifertsign
        crossingtoseifertsigncp = deepcopy(crossingtoseifertsign)
        tmp = []
        reg = [0 for i in range(len(sc))]
        if crossingtoseifertsign[1][0] == -1:
            #reg[0] = crossingtoseifert[1][0][1]
            #reg[1] = crossingtoseifert[1][0][2]
            tmp.append(crossingtoseifert[1][0][1])
            tmp.append(crossingtoseifert[1][0][2])
            #leave.append(crossingtoseifert[1][0][1])
            #leave.append(crossingtoseifert[1][0][2])
        elif crossingtoseifertsign[1][0] == 1:
            #reg[0] = crossingtoseifert[1][0][2]
            #reg[1] = crossingtoseifert[1][0][3]
            tmp.append(crossingtoseifert[1][0][2])
            tmp.append(crossingtoseifert[1][0][3])
            #leave.append(crossingtoseifert[1][0][2])
            #leave.append(crossingtoseifert[1][0][3])
        #print reg
        #print tmp
        for i in leaving:
            if set(tmp) == set(i):
                reg[0] = i[0]
                reg[1] = i[1]
        crossing = []
        crossing.append(crossingtoseifert[1][0])
        q = 0
        while q < len(pd_code):
            for val in zip(reg, reg[1:]):
                #print val
                for i in range(len(entering)):
                    if set(val) == set(entering[i]):
                        print val
                        #print entering[i]
                        crossing.append(pd_code[i])
                        #del pd_code[i]
                        if sign[i] == '-':
                            #reg[reg.index(val[0])] = pd_code[i][1]
                            #reg[reg.index(val[1])] = pd_code[i][2]
                            print leaving[i][0]
                            print leaving[i][1]
                            reg[reg.index(val[0])] = leaving[i][0]
                            reg[reg.index(val[1])] = leaving[i][1]
                            print reg
                            q = q + 1
                            break
                        elif sign[i] == '+':
                            print leaving[i][1]
                            print leaving[i][0]
                            if list(val) == entering[i]:
                                reg[reg.index(val[0])] = leaving[i][1]
                                reg[reg.index(val[1])] = leaving[i][0]
                            elif set(val) == set(entering[i]):
                                reg[reg.index(val[0])] = leaving[i][0]
                                reg[reg.index(val[1])] = leaving[i][1]
                            print reg
                            q = q + 1
                            break
                        #del pd_code[i]
                    if len(list(set(val).intersection(set(entering[i])))) == 1 and 0 in set(val):
                        crossing.append(pd_code[i])
                        #del pd_code[i]
                        if sign[i] == '-':
                            #reg[reg.index(val[0])+1] = pd_code[i][2]
                            #reg[reg.index(val[0])] = pd_code[i][1]
                            reg[reg.index(val[0])+1] = leaving[i][1]
                            reg[reg.index(val[0])] = leaving[i][0]
                            print reg
                            q = q + 1
                            break
                            #reg[reg.index(val[0])+1] = pd_code[i][2]
                        elif sign[i] == '+':
                            reg[reg.index(val[0])+1] = pd_code[i][2]
                            reg[reg.index(val[0])] = pd_code[i][3]
                            print reg
                            q = q + 1
                            break
                #q = q + 1        #del pd_code[i]
                            #reg[reg.index(val[0])+1] = pd_code[i][3]
        #print pd_code
        del crossing[len(pd_code)]
        print crossing
        for i in range(1,len(sc)):
            for j in crossingtoseifertcp[i]:
                x = crossingtoseifertcp[i+1].index(j)
                del crossingtoseifertcp[i+1][x]
                del crossingtoseifertsigncp[i+1][x]
                #print bn[i+1][x]
        print crossingtoseifertcp
        print crossingtoseifertsigncp
        braid = []
        for i in crossing:
            for j,k in crossingtoseifertcp.items():
                for l in k:
                    if i == l:
                        braid.append(j*crossingtoseifertsigncp[j][k.index(l)])
        print braid
︡bc7fe78a-bb83-4ed5-9df6-eb7f42fd9ebc︡
︠74fd8fd2-623e-4ec7-a7c9-f21f24262d8d︠









