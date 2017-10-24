function NewChrom = Crossover(Chrom,N,px) 
% ˼·���ҵ�ÿһ������ͬ��ֵ������һ������
% ��Ϊ�������ļ������裬���ֱ����һ���
% �Ŵ��㷨����Ľ����㷨�кܴ�Ĳ�ͬ
% Ϊ�˼򻯳�����ƹ��̣���Ⱦɫ�彻���Ϊ����
% 1.Ⱦɫ���Խ��棨����ʣ�
% 2.Ⱦɫ�廥���棨С���ʣ�
% ���Խ���������
% �������ظ���̭����
Pc = px;                   %Ĭ�Ͻ������Ϊ0.7
[M1,M2] = size(Chrom);
NewChrom = zeros(M1,N);
for i= 1:M1
    NewChrom(i,:) = mod(find(Chrom(i,:)),10);
%     subplot(121),spy(reshape(Chrom(i,:),10,10)); %%%%%froTest
    nRand = rand;
    if nRand < Pc                  %�Խ���
        nRand = ceil(nRand*10);
        for j = 1:nRand
            a = floor(rand*10)+1;
            b = floor(rand*10)+1;
            Temp = NewChrom(i,a);
            NewChrom(i,a) = NewChrom(i,b);
            NewChrom(i,b) = Temp;
        end
    end
%     CheckChrom = Dec2Bin(NewChrom(i,:),10,10);
%     subplot(122),spy(reshape(CheckChrom,10,10));pause
end

%% �����ظ�ɾ������
i = 1;
while i <= size(NewChrom,1)
    Sum = zeros(1,length(i+1:size(NewChrom,1)));
    k = 1;
    for j = i+1:size(NewChrom,1)
        Sum(k) = sum([NewChrom(i,:) - NewChrom(j,:)] == 0);
    end
    loc = find(Sum == 10) + i;
    NewChrom(loc,:) = [];
    i = i +1;
end

a=0;


