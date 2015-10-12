 
def str_to_str_of_bits(str)
	res = Array.new()
	i=0;
	str.bytes.map do |character|
		str_byte = character.to_s(2) #представляем каждый символ в 2чном виде
		 while str_byte.length<8 do
		 	str_byte.insert(0,"0") #дополняем "строку пустыми битами"(руби же первые нули байта не выводит)
		 end
		 res[i]=str_byte
		 i+=1
	end
	res.join #объединили все в одну строку
end

def str_of_bits_to_str(str) 
	res = String.new() 
	i=0
	sti = str.scan(/(.{1,8})/)# разбиваем строку на массивы подмассивов состоящих из строк длиной 8 символов
	sti.each do |s|
		res[i] = s.join.to_i(2).chr # переводим строку из двоичного представления числа в символ
		i+=1
	end
	res
end

def bitstuff (msg)
	"~".bytes.join.to_i.to_s(2).gsub(/(111111)/){ $1 + "1" } << msg
end

def pack_msg(msg)
	temp = str_to_str_of_bits msg #представление строки в 2ичном виде
	bmsg = bitstuff temp #битстаффигн + собщение
	msgToSend = str_of_bits_to_str bmsg #превращаем назад в строку
end

def rebitstuff(bmsg)
	bmsg.gsub(/(1111111)/){ "0111111" }	
end

def show_pack(bmsg)
	data = str_of_bits_to_str bmsg
end