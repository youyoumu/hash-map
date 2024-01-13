require './lib/hash_map.rb'

hash = HashMap.new
random_string = 'Jyvd=,E&hJk,XwyO6,KZ*fC,TuK&1,tmzjh,fC+4$,&uGja,=&k!Q,ymASY,NF=Z7,94Onq,Guav@,&cK22,OjuWu,ao3yC,5RCcm,QA3#t,7c$YX,@k3tT,59BdE,ya+s@,mpzkz,S%aZ@,gJN@m,c2BTA,+WgWM,moDfX,nxxfG,$uaua,&+mO7,Kpb+x,RrdKm,Mwtr9,25cRn,6CKt2,pg#$!,=Hc!R,8o6%N,GGqa&,DNOHy,wDx!A,sw!u3,*rDt!,*8o*J,TprM6,NrRFh,y!ZgW,8%dqU,2p*A4'
arr_string = random_string.split(',')

arr_string.each do |string|
  hash.set(string, 'value')
end

hash.print_buckets
