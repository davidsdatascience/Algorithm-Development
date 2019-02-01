︠357c8de6-c837-49a0-b498-092435a96447︠
#Exact Computation and Asymptotic Approximations of 6j Symbols: Illustration of Their Semiclassical Limits


N=320
M=320
n=0
m=0
l=20
L=0
#Lmax
Lmax=640
wig6j_data=[]
L_data=[]
cos_data=[]


#dnm = ((-1)**(N+M+m+Lmax))*sqrt((2*N+n+l)*(2*M+m+1))*wigner_6j(N+n,N,l,M+n,M,Lmax, prec=1000)
#print "Wigner d matrix element dnm =", numerical_approx(dnm, digits=10)

for L in range(0, Lmax, 2):
    w1 =wigner_6j(N+n,N,l,M+n,M,L, prec=1000)  #equ 10
    print "Wigner 6j =", numerical_approx(w1, digits=10)
    costhetaL=((2*L+1)-(2*N+n+1)-(2*M+m+1))/(2*(2*N+n+1)*(2*M+m+1))
    print "cos =", numerical_approx(costhetaL, digits=10)
    wig6j_data.append(w1)
    L_data.append(L)
    cos_data.append(costhetaL)

data=zip(L_data,wig6j_data)
data1=zip(cos_data,wig6j_data)
scatter_plot(data)
scatter_plot(data1)

︡84c3ec2c-4442-43df-a378-62e55bf5bcaf︡{"stdout":"Wigner 6j = 0.001560062402\ncos = -0.001558845505\nWigner 6j = 0.001550503997\ncos = -0.001553977916\nWigner 6j = 0.001528314385\ncos = -0.001549110326\nWigner 6j = 0.001493764064\ncos = -0.001544242737\nWigner 6j = 0.001447273820\ncos = -0.001539375148\nWigner 6j = 0.001389409082\ncos = -0.001534507558\nWigner 6j = 0.001320872340\ncos = -0.001529639969\nWigner 6j = 0.001242493735\ncos = -0.001524772379\nWigner 6j = 0.001155219945\ncos = -0.001519904790\nWigner 6j = 0.001060101526\ncos = -0.001515037201\nWigner 6j = 0.0009582788813\ncos = -0.001510169611\nWigner 6j = 0.0008509670596\ncos = -0.001505302022\nWigner 6j = 0.0007394395804\ncos = -0.001500434432\nWigner 6j = 0.0006250115247\ncos = -0.001495566843\nWigner 6j = 0.0005090221160\ncos = -0.001490699254\nWigner 6j = 0.0003928170364\ncos = -0.001485831664\nWigner 6j = 0.0002777307208\ncos = -0.001480964075\nWigner 6j = 0.0001650688748\ncos = -0.001476096485\nWigner 6j = 0.00005609145693\ncos = -0.001471228896\nWigner 6j = -0.00004800364063\ncos = -0.001466361307\nWigner 6j = -0.0001460959887\ncos = -0.001461493717\nWigner 6j = -0.0002371568839\ncos = -0.001456626128\nWigner 6j = -0.0003202622827\ncos = -0.001451758538\nWigner 6j = -0.0003946042322\ncos = -0.001446890949\nWigner 6j = -0.0004595006416\ncos = -0.001442023360\nWigner 6j = -0.0005144032647\ncos = -0.001437155770\nWigner 6j = -0.0005589037885\ncos = -0.001432288181\nWigner 6j = -0.0005927379481\ncos = -0.001427420591\nWigner 6j = -0.0006157876201\ncos = -0.001422553002\nWigner 6j = -0.0006280808696\ncos = -0.001417685413\nWigner 6j = -0.0006297899618\ncos = -0.001412817823\nWigner 6j = -0.0006212273716\ncos = -0.001407950234\nWigner 6j = -0.0006028398585\ncos = -0.001403082644\nWigner 6j = -0.0005752006966\ncos = -0.001398215055\nWigner 6j = -0.0005390001804\ncos = -0.001393347466\nWigner 6j = -0.0004950345469\ncos = -0.001388479876\nWigner 6j = -0.0004441934817\ncos = -0.001383612287\nWigner 6j = -0.0003874463912\ncos = -0.001378744697\nWigner 6j = -0.0003258276462\ncos = -0.001373877108\nWigner 6j = -0.0002604210121\ncos = -0.001369009519\nWigner 6j = -0.0001923434942\ncos = -0.001364141929\nWigner 6j = -0.0001227288342\ncos = -0.001359274340\nWigner 6j = -0.00005271089890\ncos = -0.001354406750\nWigner 6j = 0.00001659279762\ncos = -0.001349539161\nWigner 6j = 0.00008409719879\ncos = -0.001344671572\nWigner 6j = 0.0001487652042\ncos = -0.001339803982\nWigner 6j = 0.0002096223377\ncos = -0.001334936393\nWigner 6j = 0.0002657703743\ncos = -0.001330068803\nWigner 6j = 0.0003163997290\ncos = -0.001325201214\nWigner 6j = 0.0003608004317\ncos = -0.001320333625\nWigner 6j = 0.0003983715318\ncos = -0.001315466035\nWigner 6j = 0.0004286287998\ncos = "}︡{"stdout":"-0.001310598446\nWigner 6j = 0.0004512106193\ncos = -0.001305730856\nWigner 6j = 0.0004658819901\ncos = -0.001300863267\nWigner 6j = 0.0004725365894\ncos = -0.001295995678\nWigner 6j = 0.0004711968709\ncos = -0.001291128088\nWigner 6j = 0.0004620122060\ncos = -0.001286260499\nWigner 6j = 0.0004452551062\ncos = -0.001281392909\nWigner 6j = 0.0004213155900\ncos = -0.001276525320\nWigner 6j = 0.0003906937878\ncos = -0.001271657731\nWigner 6j = 0.0003539909054\ncos = -0.001266790141\nWigner 6j = 0.0003118986889\ncos = -0.001261922552\nWigner 6j = 0.0002651875602\ncos = -0.001257054962\nWigner 6j = 0.0002146936079\ncos = -0.001252187373\nWigner 6j = 0.0001613046405\ncos = -0.001247319784\nWigner 6j = 0.0001059455197\ncos = -0.001242452194\nWigner 6j = 0.00004956300314\ncos = -0.001237584605\nWigner 6j = -6.889664421e-6\ncos = -0.001232717015\nWigner 6j = -0.00006246817177\ncos = -0.001227849426\nWigner 6j = -0.0001162523315\ncos = -0.001222981837\nWigner 6j = -0.0001673608022\ncos = -0.001218114247\nWigner 6j = -0.0002149651118\ncos = -0.001213246658\nWigner 6j = -0.0002583027623\ncos = -0.001208379068\nWigner 6j = -0.0002966892103\ncos = -0.001203511479\nWigner 6j = -0.0003295285348\ncos = -0.001198643890\nWigner 6j = -0.0003563226250\ncos = -0.001193776300\nWigner 6j = -0.0003766787437\ncos = -0.001188908711\nWigner 6j = -0.0003903153467\ncos = -0.001184041121\nWigner 6j = -0.0003970660680\ncos = -0.001179173532\nWigner 6j = -0.0003968818068\ncos = -0.001174305943\nWigner 6j = -0.0003898308851\ncos = -0.001169438353\nWigner 6j = -0.0003760972753\ncos = -0.001164570764\nWigner 6j = -0.0003559769251\ncos = -0.001159703174\nWigner 6j = -0.0003298722425\ncos = -0.001154835585\nWigner 6j = -0.0002982848292\ncos = -0.001149967996\nWigner 6j = -0.0002618065822\ncos = -0.001145100406\nWigner 6j = -0.0002211093092\ncos = -0.001140232817\nWigner 6j = -0.0001769330272\ncos = -0.001135365227\nWigner 6j = -0.0001300731375\ncos = -0.001130497638\nWigner 6j = -0.00008136668817\ncos = -0.001125630049\nWigner 6j = -0.00003167795142\ncos = -0.001120762459\nWigner 6j = 0.00001811644534\ncos = -0.001115894870\nWigner 6j = 0.00006714258614\ncos = -0.001111027280\nWigner 6j = 0.0001145442792\ncos = -0.001106159691\nWigner 6j = 0.0001594977634\ncos = -0.001101292102\nWigner 6j = 0.0002012258589\ncos = -0.001096424512\nWigner 6j = 0.0002390113233\ncos = -0.001091556923\nWigner 6j ="}︡{"stdout":" 0.0002722091824\ncos = -0.001086689333\nWigner 6j = 0.0003002578247\ncos = -0.001081821744\nWigner 6j = 0.0003226886658\ncos = -0.001076954155\nWigner 6j = 0.0003391342128\ncos = -0.001072086565\nWigner 6j = 0.0003493343845\ncos = -0.001067218976\nWigner 6j = 0.0003531409719\ncos = -0.001062351386\nWigner 6j = 0.0003505201556\ncos = -0.001057483797\nWigner 6j = 0.0003415530256\ncos = -0.001052616208\nWigner 6j = 0.0003264340891\ncos = -0.001047748618\nWigner 6j = 0.0003054677791\ncos = -0.001042881029\nWigner 6j = 0.0002790630164\ncos = -0.001038013439\nWigner 6j = 0.0002477259106\ncos = -0.001033145850\nWigner 6j = 0.0002120507164\ncos = -0.001028278261\nWigner 6j = 0.0001727091947\ncos = -0.001023410671\nWigner 6j = 0.0001304385577\ncos = -0.001018543082\nWigner 6j = 0.00008602820153\ncos = -0.001013675492\nWigner 6j = 0.00004030545479\ncos = -0.001008807903\nWigner 6j = -5.879410880e-6\ncos = -0.001003940314\nWigner 6j = -0.00005166864444\ncos = -0.0009990727242\nWigner 6j = -0.00009621268080\ncos = -0.0009942051348\nWigner 6j = -0.0001386857277\ncos = -0.0009893375454\nWigner 6j = -0.0001783009927\ncos = -0.0009844699560\nWigner 6j = -0.0002143252734\ncos = -0.0009796023666\nWigner 6j = -0.0002460926393\ncos = -0.0009747347772\nWigner 6j = -0.0002730169523\ncos = -0.0009698671878\nWigner 6j = -0.0002946029848\ncos = -0.0009649995984\nWigner 6j = -0.0003104559220\ncos = -0.0009601320090\nWigner 6j = -0.0003202890584\ncos = -0.0009552644196\nWigner 6j = -0.0003239295316\ncos = -0.0009503968302\nWigner 6j = -0.0003213219676\ncos = -0.0009455292408\nWigner 6j = -0.0003125299523\ncos = -0.0009406616514\nWigner 6j = -0.0002977352778\ncos = -0.0009357940620\nWigner 6j = -0.0002772349575\ncos = -0.0009309264726\nWigner 6j = -0.0002514360416\ncos = -0.0009260588832\nWigner 6j = -0.0002208483077\ncos = -0.0009211912938\nWigner 6j = -0.0001860749408\ncos = -0.0009163237044\nWigner 6j = -0.0001478013576\ncos = -0.0009114561150\nWigner 6j = -0.0001067823646\ncos = -0.0009065885256\nWigner 6j = -0.00006382787704\ncos = -0.0009017209362\nWigner 6j = -0.00001978745326\ncos = -0.0008968533468\nWigner 6j ="}︡{"stdout":" 0.00002446607314\ncos = -0.0008919857574\nWigner 6j = 0.00006805355939\ncos = -0.0008871181680\nWigner 6j = 0.0001101067980\ncos = -0.0008822505786\nWigner 6j = 0.0001497857090\ncos = -0.0008773829892\nWigner 6j = 0.0001862951459\ncos = -0.0008725153998\nWigner 6j = 0.0002189009804\ncos = -0.0008676478104\nWigner 6j = 0.0002469451437\ncos = -0.0008627802210\nWigner 6j = 0.0002698593122\ncos = -0.0008579126316\nWigner 6j = 0.0002871769501\ncos = -0.0008530450422\nWigner 6j = 0.0002985434455\ncos = -0.0008481774528\nWigner 6j = 0.0003037241119\ncos = -0.0008433098634\nWigner 6j = 0.0003026098638\ncos = -0.0008384422740\nWigner 6j = 0.0002952204166\ncos = -0.0008335746846\nWigner 6j = 0.0002817049090\ncos = -0.0008287070952\nWigner 6j = 0.0002623398958\ncos = -0.0008238395058\nWigner 6j = 0.0002375247086\ncos = -0.0008189719164\nWigner 6j = 0.0002077742375\ncos = -0.0008141043270\nWigner 6j = 0.0001737092380\ncos = -0.0008092367376\nWigner 6j = 0.0001360443216\ncos = -0.0008043691482\nWigner 6j = 0.00009557383708\ncos = -0.0007995015588\nWigner 6j = 0.00005315589896\ncos = -0.0007946339694\nWigner 6j = 9.694862595e-6\ncos = -0.0007897663800\nWigner 6j = -0.00003387741699\ncos = -0.0007848987906\nWigner 6j = -0.00007662117096\ncos = -0.0007800312012\nWigner 6j = -0.0001176087510\ncos = -0.0007751636118\nWigner 6j = -0.0001559446970\ncos = -0.0007702960225\nWigner 6j = -0.0001907854119\ncos = -0.0007654284330\nWigner 6j = -0.0002213580181\ncos = -0.0007605608437\nWigner 6j = -0.0002469779733\ncos = -0.0007556932542\nWigner 6j = -0.0002670650439\ncos = -0.0007508256649\nWigner 6j = -0.0002811572557\ncos = -0.0007459580755\nWigner 6j = -0.0002889224792\ncos = -0.0007410904861\nWigner 6j = -0.0002901673452\ncos = -0.0007362228967\nWigner 6j = -0.0002848432411\ncos = -0.0007313553073\nWigner 6j = -0.0002730491908\ncos = -0.0007264877179\nWigner 6j ="}︡{"stdout":" -0.0002550314886\ncos = -0.0007216201285\nWigner 6j = -0.0002311800219\ncos = -0.0007167525391\nWigner 6j = -0.0002020212913\ncos = -0.0007118849497\nWigner 6j = -0.0001682082095\ncos = -0.0007070173603\nWigner 6j = -0.0001305068350\ncos = -0.0007021497709\nWigner 6j = -0.00008978026906\ncos = -0.0006972821815\nWigner 6j = -0.00004697001661\ncos = -0.0006924145921\nWigner 6j = -3.075176540e-6\ncos = -0.0006875470027\nWigner 6j = 0.00004087011230\ncos = -0.0006826794133\nWigner 6j = 0.00008382049003\ncos = -0.0006778118239\nWigner 6j = 0.0001247439370\ncos = -0.0006729442345\nWigner 6j = 0.0001626465214\ncos = -0.0006680766451\nWigner 6j = 0.0001965967551\ncos = -0.0006632090557\nWigner 6j = 0.0002257489718\ncos = -0.0006583414663\nWigner 6j = 0.0002493651443\ncos = -0.0006534738769\nWigner 6j = 0.0002668345768\ncos = -0.0006486062875\nWigner 6j = 0.0002776909403\ncos = -0.0006437386981\nWigner 6j = 0.0002816261649\ncos = -0.0006388711087\nWigner 6j = 0.0002785007613\ncos = -0.0006340035193\nWigner 6j = 0.0002683502177\ncos = -0.0006291359299\nWigner 6j = 0.0002513872005\ncos = -0.0006242683405\nWigner 6j = 0.0002279993806\ncos = -0.0006194007511\nWigner 6j = 0.0001987428087\ncos = -0.0006145331617\nWigner 6j = 0.0001643308723\ncos = -0.0006096655723\nWigner 6j = 0.0001256189759\ncos = -0.0006047979829\nWigner 6j = 0.00008358520238\ncos = -0.0005999303935\nWigner 6j = 0.00003930732094\ncos = -0.0005950628041\nWigner 6j = -6.063382873e-6\ncos = -0.0005901952147\nWigner 6j = -0.00005133088117\ncos = -0.0005853276253\nWigner 6j = -0.00009528511806\ncos = -0.0005804600359\nWigner 6j = -0.0001367339238\ncos = -0.0005755924465\nWigner 6j = -0.0001745353271\ncos = -0.0005707248571\nWigner 6j = -0.0002076294209\ncos = -0.0005658572677\nWigner 6j = -0.0002350689137\ncos = -0.0005609896783\nWigner 6j ="}︡{"stdout":" -0.0002560474973\ncos = -0.0005561220889\nWigner 6j = -0.0002699251839\ncos = -0.0005512544995\nWigner 6j = -0.0002762498106\ncos = -0.0005463869101\nWigner 6j = -0.0002747739790\ncos = -0.0005415193207\nWigner 6j = -0.0002654667910\ncos = -0.0005366517313\nWigner 6j = -0.0002485198550\ncos = -0.0005317841419\nWigner 6j = -0.0002243471771\ncos = -0.0005269165525\nWigner 6j = -0.0001935786987\ncos = -0.0005220489631\nWigner 6j = -0.0001570474178\ncos = -0.0005171813737\nWigner 6j = -0.0001157702050\ncos = -0.0005123137843\nWigner 6j = -0.00007092261585\ncos = -0.0005074461949\nWigner 6j = -0.00002380818596\ncos = -0.0005025786055\nWigner 6j = 0.00002417711575\ncos = -0.0004977110161\nWigner 6j = 0.00007158442831\ncos = -0.0004928434267\nWigner 6j = 0.0001169545227\ncos = -0.0004879758373\nWigner 6j = 0.0001588621570\ncos = -0.0004831082479\nWigner 6j = 0.0001959609948\ncos = -0.0004782406585\nWigner 6j = 0.0002270277360\ncos = -0.0004733730691\nWigner 6j = 0.0002510040588\ncos = -0.0004685054797\nWigner 6j = 0.0002670349644\ncos = -0.0004636378903\nWigner 6j = 0.0002745021487\ncos = -0.0004587703009\nWigner 6j = 0.0002730511057\ncos = -0.0004539027115\nWigner 6j = 0.0002626107913\ncos = -0.0004490351221\nWigner 6j = 0.0002434048463\ncos = -0.0004441675327\nWigner 6j = 0.0002159535938\ncos = -0.0004392999433\nWigner 6j = 0.0001810662760\ncos = -0.0004344323539\nWigner 6j = 0.0001398232893\ncos = -0.0004295647645\nWigner 6j = 0.00009354849024\ncos = -0.0004246971751\nWigner 6j = 0.00004377198556\ncos = -0.0004198295857\nWigner 6j = -7.815833834e-6\ncos = -0.0004149619963\nWigner 6j = -0.00005941790448\ncos = -0.0004100944069\nWigner 6j = -0.0001091903014\ncos = -0.0004052268175\nWigner 6j = -0.0001553064891\ncos = -0.0004003592281\nWigner 6j ="}︡{"stdout":" -0.0001960239776\ncos = -0.0003954916387\nWigner 6j = -0.0002297511236\ncos = -0.0003906240493\nWigner 6j = -0.0002551116540\ncos = -0.0003857564599\nWigner 6j = -0.0002710044003\ncos = -0.0003808888705\nWigner 6j = -0.0002766557294\ncos = -0.0003760212811\nWigner 6j = -0.0002716622427\ncos = -0.0003711536917\nWigner 6j = -0.0002560215052\ncos = -0.0003662861023\nWigner 6j = -0.0002301488495\ncos = -0.0003614185129\nWigner 6j = -0.0001948786912\ncos = -0.0003565509235\nWigner 6j = -0.0001514492712\ncos = -0.0003516833341\nWigner 6j = -0.0001014703126\ncos = -0.0003468157447\nWigner 6j = -0.00004687371942\ncos = -0.0003419481553\nWigner 6j = 0.00001015185439\ncos = -0.0003370805659\nWigner 6j = 0.00006724100968\ncos = -0.0003322129765\nWigner 6j = 0.0001219438816\ncos = -0.0003273453871\nWigner 6j = 0.0001718276809\ncos = -0.0003224777977\nWigner 6j = 0.0002145838206\ncos = -0.0003176102083\nWigner 6j = 0.0002481363776\ncos = -0.0003127426189\nWigner 6j = 0.0002707471933\ncos = -0.0003078750295\nWigner 6j = 0.0002811126213\ncos = -0.0003030074401\nWigner 6j = 0.0002784468385\ncos = -0.0002981398507\nWigner 6j = 0.0002625467505\ncos = -0.0002932722613\nWigner 6j = 0.0002338338901\ncos = -0.0002884046719\nWigner 6j = 0.0001933693262\ncos = -0.0002835370825\nWigner 6j = 0.0001428384839\ncos = -0.0002786694931\nWigner 6j = 0.00008450391746\ncos = -0.0002738019037\nWigner 6j = 0.00002112544995\ncos = -0.0002689343143\nWigner 6j = -0.00004415132298\ncos = -0.0002640667249\nWigner 6j = -0.0001079354424\ncos = -0.0002591991355\nWigner 6j = -0.0001667553651\ncos = -0.0002543315461\nWigner 6j = -0.0002172417463\ncos = -0.0002494639567\nWigner 6j = -0.0002563201261\ncos = -0.0002445963673\nWigner 6j = -0.0002814038842\ncos = -0.0002397287779\nWigner 6j = -0.0002905766008\ncos = -0.0002348611885\nWigner 6j ="}︡{"stdout":" -0.0002827521726\ncos = -0.0002299935991\nWigner 6j = -0.0002578007931\ncos = -0.0002251260097\nWigner 6j = -0.0002166293290\ncos = -0.0002202584203\nWigner 6j = -0.0001612057974\ncos = -0.0002153908309\nWigner 6j = -0.00009451964960\ncos = -0.0002105232415\nWigner 6j = -0.00002047241169\ncos = -0.0002056556521\nWigner 6j = 0.00005630308592\ncos = -0.0002007880627\nWigner 6j = 0.0001306922119\ncos = -0.0001959204733\nWigner 6j = 0.0001974090295\ncos = -0.0001910528839\nWigner 6j = 0.0002513545665\ncos = -0.0001861852945\nWigner 6j = 0.0002880040530\ncos = -0.0001813177051\nWigner 6j = 0.0003037989846\ncos = -0.0001764501157\nWigner 6j = 0.0002965152347\ncos = -0.0001715825263\nWigner 6j = 0.0002655750292\ncos = -0.0001667149369\nWigner 6j = 0.0002122689503\ncos = -0.0001618473475\nWigner 6j = 0.0001398548485\ncos = -0.0001569797581\nWigner 6j = 0.00005350414688\ncos = -0.0001521121687\nWigner 6j = -0.00003992699922\ncos = -0.0001472445793\nWigner 6j = -0.0001323135448\ncos = -0.0001423769899\nWigner 6j = -0.0002148617703\ncos = -0.0001375094005\nWigner 6j = -0.0002788731552\ncos = -0.0001326418111\nWigner 6j = -0.0003166301276\ncos = -0.0001277742217\nWigner 6j = -0.0003223390044\ncos = -0.0001229066323\nWigner 6j = -0.0002930424297\ncos = -0.0001180390429\nWigner 6j = -0.0002293929777\ncos = -0.0001131714535\nWigner 6j = -0.0001361644653\ncos = -0.0001083038641\nWigner 6j = -0.00002237185011\ncos = -0.0001034362747\nWigner 6j = 0.00009912112978\ncos = -0.00009856868534\nWigner 6j = 0.0002126002839\ncos = -0.00009370109594\nWigner 6j = 0.0003011481821\ncos = -0.00008883350654\nWigner 6j = 0.0003489046818\ncos = -0.00008396591714\nWigner 6j = 0.0003437968467\ncos = -0.00007909832774\nWigner 6j = 0.0002804573674\ncos = -0.00007423073834\nWigner 6j = "}︡{"stdout":"0.0001628918641\ncos = -0.00006936314894\nWigner 6j = 6.290475321e-6\ncos = -0.00006449555954\nWigner 6j = -0.0001627638936\ncos = -0.00005962797014\nWigner 6j = -0.0003085130112\ncos = -0.00005476038074\nWigner 6j = -0.0003914236070\ncos = -0.00004989279134\nWigner 6j = -0.0003772164562\ncos = -0.00004502520194\nWigner 6j = -0.0002492604693\ncos = -0.00004015761254\nWigner 6j = -0.00002274565036\ncos = -0.00003529002315\nWigner 6j = 0.0002431810088\ncos = -0.00003042243375\nWigner 6j = 0.0004426696559\ncos = -0.00002555484435\nWigner 6j = 0.0004425437903\ncos = -0.00002068725495\nWigner 6j = 0.0001444592964\ncos = -0.00001581966555\nWigner 6j = -0.0003780882746\ncos = -0.00001095207615\nWigner 6j = -0.0006197595709\ncos = -6.084486749e-6\n"}︡{"once":false,"file":{"show":true,"uuid":"249b709b-38ec-4edf-90ee-0eac9bd74c9e","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute1-us/30425/tmp_OyKLE4.svg"}}︡{"html":"<div align='center'></div>"}︡{"once":false,"file":{"show":true,"uuid":"95b77d0e-2948-4c98-89ec-fe445fdb9526","filename":"/projects/e8f322dc-857a-4e9d-90d6-11b47e1ad677/.sage/temp/compute1-us/30425/tmp_rr34Z1.svg"}}︡{"html":"<div align='center'></div>"}︡
︠a7d788b5-06bc-40e9-b7b5-eb064ca9e324︠









