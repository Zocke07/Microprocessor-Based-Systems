![螢幕擷取畫面 2023-10-20 212926](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/093b5676-8ea8-494e-9df8-823ee555d47b)# 實驗二：多位元加法器 & 多位元減法器設計  
> 組合電路設計流程 & 階層化設計

## 基本概念  
- 組合邏輯電路 (Combination Logic Circuit)：主要在於它的輸出只受輸入函數的控 制，而不受先前輸入及 狀態記憶影響。
- 下圖為組合邏輯電路之概念圖

![螢幕擷取畫面 2023-10-20 210729](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/75323e8b-eca3-45de-961d-cda013b306c8)
 

## 組合邏輯電路的設計流程
1. 需求敘述:將所需問題加以闡述說明。
2. 分析：將需求加以分析並以真值表描述輸入與輸出的關係，然後再由真值表導出布林函數。
3. 布林函數化簡：將找出來的布林函數加以化簡成最簡式，藉以縮減邏輯閘的使用。
4. 撰寫VHDL程式碼。
5. 實驗。

## 多位元加法器電路之設計
設計一個8 bit（1bit符號 7bit有效位元）多位元加法器， 輸入腳位為A7、A6、A5、 A4、A3、A2、A1、A0 、B7 、B6、B5、B4 、B3、B2、B1、B0而二補數加法 器的輸 出為S7、S6、S5、S4、S3、S2、S1、S0(二進位)，要將 二進位轉換為十 六進位並用七段顯示器顯示出結果。  
![螢幕擷取畫面 2023-10-20 211103](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/24e6b1fa-227b-4b78-b4ec-de847817c20d)  

## 全加器電路圖  
![螢幕擷取畫面 2023-10-20 211258](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/bc9e4560-6a2e-4d97-bf30-286b50dd35c4)  

## 真值表  
![螢幕擷取畫面 2023-10-20 211327](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/4472d53d-3e2e-4b24-a6c5-7adc22a10d90)  

## 布林等式  
利用真值表寫出對等的布林等式並化簡。  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b29cab8c-dd32-4750-9f68-e6c8aadee160)  

## VHDL參考程式架構
```
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all; -- Use宣告區&標準定義宣告庫
ENTITY example IS
  PORT(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    S: in std_logic_vector(7 downto 0));
END example;
ARCHITECTURE a OF example IS
  SIGNAL C: std_logic_vector(7 downto 0);
BEGIN
  (output pins)<=(input pins)
  (signals)<=(input pins)
  (output pins)<=(signals)
END a;
```
- STD_LOGIC表現的型態是實際數位電路 在輸 入或輸出位準所呈現的邏輯特性，它 比BIT訊 號所能描述的邏輯特性更為真實 且完整。 STD_LOGIC為BIT的強化訊號型 別，可以與 BIT互換。
- Signal指令式宣告電路內部自行 使用的訊號， 因為這類訊號沒有 傳送到電路的外部界面， 所以通 常我們都在架構(architecture)中 宣告它。

## 電路設計  
![螢幕擷取畫面 2023-10-20 211917](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/3cca736e-4786-4240-96dc-b442cc29dad6)

## Package與Component教學
- 第一步：建立邏輯電路
  - 將需要用到的輸入輸出做定義。
  - 建立需要實現的邏輯電路。
  - 以 fulladd.vhd 為範例，此步驟需要建立一個獨立檔，內容如下
```
library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
  port( Cin,x,y  : in std_logic;
        s,Cout  : out std_logic);
end fulladd;

architecture func of fulladd is
begin
  s <= x xor y xor Cin;
  Cout <= (x and y) or (Cin and x) or (Cin and y);
end func;
```

- 第二步：建立 Component
  - 將定義好的 PORT 部分填入 Component 中。
  - 此時的 Component 會是一個類似 Class 的存在，具有變數定義與 函式功能。
  - 在主程式中使用相當於建立一個 Class object，用 “port map” 來呼叫Component 中要使用 的函式。
  - 可以執行 Component 底下的邏輯電路功能。
```
component fulladd
  port( Cin,x,y  : in std_logic;
        s, Cout  : out std_logic);
end component;
```

- 第三步：建立 Package\
  - 將 Component 包成 Package。
  - Package 建立完成後會是一個類似 C++ 中 “.h” 檔的存在。
  - 建立完後要使用 Use 來匯入 Package，使 得主程式可以使用在 Package 中定義好的 函式 (邏輯電路)。
  - 以 lab2_package.vhd 為範例，第二、三步 驟需要建立一個獨立檔 ，內容如下。
```
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
package lab2_package IS
  component fulladd
    PORT ( Cin, x, y :  IN STD_LOGIC ;
           s, Cout  : OUT STD_LOGIC) ;
  END component fulladd;

  component hex
    port (sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7:  in std_logic;
      a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2  : out std_logic);
  END component hex;
END lab2_package;
```

- 第四步：將 Package 匯入主程式
  - 使用 Quartus Prime 的“Use work.Package名稱” 語法來匯入 Package。
  - 這裡的“Use” 語法可以想成是 C++ 中的“include”。
  - 匯入完成後就可以使用定義好的邏輯電路函式。
```
use work.lab2_package.all;
```

- 第五步：匯入主程式的函數使用
  - 先命名該步驟的 label ( 以圖中的 stage0: 為例 )。
  - 若在使用相同 package 的情況下不定義 label 會被認為是重複定義 ，而出現 syntax error。
  - 語法使用“port map” 將主程式定義的輸入對應到邏輯電路中的輸入。
  - 以 main.vhd 為範例，第四、五步驟要在主程式中執行，內容如下。
```
stage0: fulladd port map (C(0),X(0),Y(0),S(0),C(1));
stage1: fulladd port map (C(1),X(1),Y(1),S(1),C(2));
stage2: fulladd port map (C(2),X(2),Y(2),S(2),C(3));
stage3: fulladd port map (C(3),X(3),Y(3),S(3),C(4));
stage4: fulladd port map (C(4),X(4),Y(4),S(4),C(5));
stage5: fulladd port map (C(5),X(5),Y(5),S(5),C(6));
stage6: fulladd port map (C(6),X(6),Y(6),S(6),C(7));
stage7: fulladd port map (C(7),X(7),Y(7),S(7),Cout);
```

## Top-Level 設定說明  
- 下拉選單選取Files  
![螢幕擷取畫面 2023-10-20 212834](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/16c2b540-4706-4e85-a512-28735e8dff82)  
- 對專案使用的.vhd檔按滑鼠右鍵，選取“Set as Top-Level Entity”
![螢幕擷取畫面 2023-10-20 212926](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/5f090e97-ce6c-4504-be83-03ae17d09ff8)
- 透過下拉選單回到Hierarchy，於編譯後即可看到使用於專案中的Component及其label
![螢幕擷取畫面 2023-10-20 213002](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/74c4a75d-c05f-4009-b870-24abf65d2339)
![螢幕擷取畫面 2023-10-20 213013](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/6991f73c-4c32-49b7-ade7-c7bd4db85cfe)
