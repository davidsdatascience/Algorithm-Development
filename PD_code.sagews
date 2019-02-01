︠ca03cca2-72d0-498d-8a59-74b6c388d925︠
def PD_code(self):
        '''dt = self.dt_code()
        y = [None for i in range(2*len(dt))]
        x = [0 for i in range(2*len(dt))]
        for i in range(len(dt)):
            x[2*i] = 2*i + 1
            x[2*i + 1] = dt[i]
        #print x
        p = [[None,None] for i in range(len(x))]
        t = [abs(r) for r in x]
        for i in range(len(t)):
            if t[i] != max(t):
                p[i][0] = t[i]
                p[i][1] = t[i] + 1
            else:
                p[i][0] = t[i]
                p[i][1] = 1
        #print p
        for i in range(len(dt)):
            if x[2*i+1] > 0:
                y[2*i+1] = 'under'
                y[2*i] = 'over'
            elif x[2*i+1] < 0:
                y[2*i+1] = 'over'
                y[2*i] = 'under'
        #print y
        for i in range(len(dt)):
            if y[2*i + 1] == 'under':
                p[2*i+1].extend(p[2*i])
            elif y[2*i + 1] == 'over':
                p[2*i].extend(p[2*i+1])
        #print p
        q = [p[i] for i in range(len(p)) if len(p[i]) == 4]
        for i in range(len(dt)):
            a = q[i][1]
            q[i][1] = q[i][2]
            q[i][2] = a
        return q
        #print p'''

        #this was the previous attempt where we used Gauss code but the orientability of the crossing was undetermined, we overcame this by using the braidword. The logic is pretty simple and will try to blog it the next time.

        b = list(self._braid.Tietze())
        N = len(b)
        label = [0 for i in range(2*N)]
        string = 1
        next_label = 1
        type1 = 0
        crossing = 0
        while(next_label <= 2*N):
            string_found = 0
            for i in range(crossing, N):
                if(abs(b[i]) == string or abs(b[i]) == string - 1):
                    string_found = 1
                    crossing = i
                    break
            if(string_found == 0):
                for i in range(0,crossing):
                    if(abs(b[i]) == string or abs(b[i]) == string - 1):
                        string_found = 1
                        crossing = i
                        break
            if(label[2*crossing + next_label%2] == 1):
                raise Exception("Implemented only for knots")
            else:
                label[2*crossing + next_label%2] =  next_label
                next_label = next_label + 1
                if(type1 == 0):
                    if(b[crossing] < 0):
                        type1 = -1
                    else:
                        type1 = 1
                else:
                    type1 = -1 * type1
                    if((abs(b[crossing]) == string and b[crossing] * type1 > 0) or (abs(b[crossing]) != string and b[crossing] * type1 < 0)):
                        if(next_label%2 == 1):
                            label[2*crossing] = label[2*crossing] * -1
            if(abs(b[crossing]) == string):
                string = string + 1
            else:
                string = string - 1
            crossing = crossing + 1
        print label
        s = [None for i in range(len(label))]
        for i in range(N):
            if cmp(label[2*i],0) == -1:
                s[2*i] = 'over'
                s[2*i+1] = 'under'
            if (label[2*i]%2 == 0 and cmp(label[2*i],0) == 1):
                s[2*i] = 'under'
                s[2*i+1] = 'over'
            if (label[2*i+1]%2 == 0 and cmp(label[2*i+1],0) == 1):
                s[2*i+1] = 'under'
                s[2*i] = 'over'
        print s
        pd = [[None for i in range(4)] for i in range(N)]
        print pd
        for j in range(N):
            #pd[j][0] = label[2*j]
            #pd[j][1] = label[2*j+1]
            if s[2*j] == 'under':

                #pd[j][0] = abs(label[2*j])
                #pd[j][2] = pd[j][0] + 1
                if cmp(b[j],0) == -1:
                    pd[j][0] = abs(label[2*j])
                    pd[j][3] = abs(label[2*j+1])
                    pd[j][2] = pd[j][0] + 1
                    pd[j][1] = pd[j][3] + 1
                elif cmp(b[j],0) == 1:
                    pd[j][0] = abs(label[2*j])
                    pd[j][1] = abs(label[2*j+1])
                    pd[j][2] = pd[j][0] + 1
                    pd[j][3] = pd[j][1] + 1
            elif s[2*j] == 'over':
                if cmp(b[j],0) == -1:
                    pd[j][0] = abs(label[2*j+1])
                    pd[j][2] = pd[j][0] + 1
                    pd[j][3] = abs(label[2*j])
                    pd[j][1] = pd[j][3] + 1
                if cmp(b[j],0) == 1:
                    pd[j][0] = abs(label[2*j+1])
                    pd[j][2] = pd[j][0] + 1
                    pd[j][1] = abs(label[2*j])
                    pd[j][3] = pd[j][1] + 1
        for i in range(len(N)):
            for j in range(len(4)):
                if pd[j][i] == max(abs(p)):
                    break
        return pd
︡22463e91-ae69-494c-bce7-d9bbda0d323d︡
︠b6f3a4f9-6b9e-4a7a-894f-72929db5f694︠









