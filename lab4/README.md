# 實驗四：七位元簡易運算器  
> Arithmetic Logic Unit (ALU)

## Functional Specification of ALU  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/0f455b10-71f6-4ee1-900d-4d707e69a110)  

## ALU基本概念  
- 算術邏輯單元(Arithmetic Logic Unit, ALU)是中央處理器(CPU)的 執行單元。
- 是所有中央處理器的核心組成部分,由“And Gate” 和
- “Or Gate”構成的算術邏輯單元。
- 主要功能是進行二進制的算術運算,如加減乘(不包括整數除法)。 基本上,在所有現代CPU體系結構中,二 進制都以二補數的形式 來表示

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/ea187ca5-c3dd-4e71-96a1-8c121a402268)  

## 1-BIT ALU
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/110456f7-20d5-465c-b81f-2f33bc18478c)  

## 4-bit ALU
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/784e83ee-7c31-41c1-8c66-7de97246ec2a)  

## How about Subtraction?  
2’s complement: take inverse of every bit and add 1 (at cin of first stage)  
- A - B = A + (-B) = A + (B’ + 1) = A + B’ + 1  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/5246b71a-8386-481a-ad82-09e4c9b74623)

## Revised Diagram
LSB and MSB need to do a little extra  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/6011f8c3-a3ea-45bd-afe1-76b7e356e938)  

## Nor Operation
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/0cfb02ae-2368-4f19-b00b-70845e67ae3f)  

## Set on Less Than
if (A-B) < 0 then Result = 1  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/2272c910-74c7-4de9-8dfa-af721cde8240)  

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/5d563418-cbc7-41c5-96f2-07f03e7bf1a3)  

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/a059526d-cdb2-4529-9d5c-70f29409a59f)  

## 32Bit ALU架構圖
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/d6ed3b92-8c5a-4dd3-b7bf-4b9c18ac14ea)  
- 綠框為ALU0
- 黃框為ALU1-30
- 藍框為ALU31
- 紅線為ALU31的set輸出,會接回ALU0的Less中作為輸入
- 而ALU1-31的Less輸入皆為0

##  GENERATE敘述
> FOR i IN .. TO .. GENERATE
- VHDL提供 FOR GENERATE敘述來描述規則的結構階層性程式 碼。
- GENERATE敘述必須有標籤,因此我們在程式碼中用標籤G1。
```
LIBRARY ieee;
USE ieee.std_logic_1164_all;

ENTITY dec4to16 IS
  PORT (  w  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
          En : IN  STD_LOGIC;
          y  : OUT STD_LOGIC_VECTOR(0 TO 15));
END dec4to16;

ARCHITECTURE Structure OF dec4to16 IS
  COMPONENT dec2to4
    PORT (  w  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            En : IN  STD_LOGIC;
            y  : OUT STD_LOGIC_VECTOR(0 TO 3));
  END COMPONENT;
  SIGNAL m  : STD_LOGIC_VECTOR(0 TO 3);
BEGIN
  G1: FOR i IN 0 TO 3 GENERATE
    Dec_ri: dec2to4 PORT MAP ( w(1 DOWNTO 0),m(i),y(4*i TO (4*i+3) );
    G2: IF i=3 GENERATE
      Dec_left: dec2to4 PORT MAP ( w(i DOWNTO i-1),En,m );
    END GENERATE;
  END GENERATE;
END Structure;
```
> 四對十六 二進位解碼器的階層性程式碼

## HINT
- if 有多個條件時的語法如下:  
  if (signalA>signalB) and (signalB>signalC)
- 將1bit的ALU寫成一個component,輸入有四個A,B,less,carryin,輸出有三個result,set,carryout,可參考下方圖。
- 輸入的less → 當bit0時, 此less輸入bit6的set; 當bit1~6時,less輸入’0’。
- 輸出的set → 當bit0~5時,雖然set並沒有輸出,但 是仍然需要給他設定一個值輸出; 當bit6時, 就必須輸出set, 並將此set給bit0的less輸入。
```
LIBRARY ieee;
USE ieee.std_logic_1164_all;
USE ieee.std_logic_unsigned.all;

ENTITY onebitALU IS
  PORT( A, B, less, carryin  : IN STD_LOGIC;
        opcode  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        result, set, carryout  : OUT STD_LOGIC);
END;

ARCHITECTURE LogicFunc OF onebitALU IS

BEGIN

-- Your Code

END LogicFunc;
```
- 用FOR迴圈來串出7-bit ALU,當bit0時輸入a, b, carryin=0及bit6 的set,輸出result, carryout及set(但這個set不需要用到);當bit6 時 輸入a, b, carryin及less=0,輸出result, carryout及set(這個set需給 bit0的less輸入)。

## 實驗要求及配分
- 實作1-bit ALU, 完成可得35%
- 使用for generate 、if generate及component完成7-bit ALU並連接7-Segment可 35% (未使用for generate 、if generate及component只可得30%)
- 實驗報告30%
- 需驗證所有ALU指令,加減法範圍為+63 ~ -64(只驗證運算結果為正數的加減 法)。
- 以Component方式整合七段顯示器顯示結果,以兩顆7-Segment顯示16進位計算結果
- <b> 不能使用PROCESS敘述 </b>

## 指定腳位 – 輸入  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/5400faf2-1235-4e57-8ab6-889e7f62a2f9)  

## 指定腳位 – 七段顯示器
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/701c77a8-ad93-4cee-87e8-e97cb363768a)
