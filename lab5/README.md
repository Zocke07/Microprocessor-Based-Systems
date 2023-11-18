# 實驗五：N位元左/右移位萬用暫存器  

## 暫存器基本概念  
- 一個正反器儲存一位元的資訊。
- 當一組n個正反器儲存n位元資訊例如n位元數值，我們稱這些正反器為暫存器 (register)。
- 暫存器中的每個正反器使用共通的時脈，且每個正反器運作如同前一節所述。
- 暫存器一詞只是方便稱呼由正反器組成的n位元架構。
- 暫存器在微電腦系統中被用在許多場合
  - 例如CPU 中的累加器 (Accumulator)
  - 電腦的IO 埠 (In-Out Port)
  - 構成它們的基本零件就是D 型正反器
- D 型正反器最大的特性是：
  - 當它的D 輸入為 “0” 時，經過脈波觸發輸入後，輸出Q 才會改變為 “0”
  - 當它的D 輸入為 “1” 時，經過脈波觸發輸入後，輸出Q 才會改變為 “1”
  - 若脈波輸入處於 “0” 或沒有觸發作用時，輸出則保留上一狀態的輸出
  - 具有記憶 “資料” 的特性，就是製作暫存器的最好零件。
- 暫存器依電路連接方式不同可分為：
  1. 並聯輸入並聯輸出（PIPO）
  2. 串聯輸入串聯輸出（SISO）
  3. 串聯輸入並聯輸出（SIPO）
  4. 並聯輸入串聯輸出（PISO）
  5. 萬用位移暫存器等（Universal Shift Register）
- 可以位移內容的暫存器稱為位移暫存器 (shift register)。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/48ae04c2-5efe-4b37-aa0d-187fdcaca85c)

## 萬用位移暫存器
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b368bf0d-876a-44ba-954e-134d16da3960)  

## 萬用位移暫存器 - 電路動作  
- 若要移左時，則需要使Load="0"與Clear="0"，設定L_R_SEL="1"，然後送上CLOCK則會向左移位。
- 若要移右時，則需要使Load="0"與Clear="0"，設定L_R_SEL="０"，然後送上CLOCK則會向右移位。
- 利用具有優先設定Preset及清除Clear的D型正反器將輸入資料如Di3~Di0配合一個Load訊號接到二輸入NAND Gate，並將輸出接至優先設定Preset及清除Clear訊號輸入

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/ca45295b-1e91-441e-be84-45331fe6ab8f)  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/2ecd5149-717a-400a-a9c1-e5ae125ac3a2)  

## 實驗目標一 8位元左/右移位萬用暫存器  
- 設計出一個可輸出8位元並左/右移的移位暫存器
- 且必須使用GENERIC來完成此實驗。
```
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY u_shift IS
	GENERIC (N : INTEGER := 8);
	PORT(	clk 	: IN STD_LOGIC;
			clear	: IN STD_LOGIC;
			load	: IN STD_LOGIC;
			lr_sel: IN STD_LOGIC;
			di		: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sdi	: IN STD_LOGIC;
			qo		: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END;
```
> 圖三，Entity範例
- clk:設定正緣觸發
- clear:將暫存器清空
- load:是否平行輸入
- di:平行輸入
- sdi:串列輸入
- lr_sel:左/右移
- qo:暫存器輸出

## ARCHITECTURE敘述  
- 首先判斷clk是否正緣觸發。
- 設定clear決定是否清空暫存器。
- 設定load決定是否平行輸入di。
- 設定lr_sel決定左/右位移。
- 使用FOR LOOP產生左/右位移。
- 將sdi串列輸入最左/右邊位元。

## 實驗要求及配分  
- 可平行輸入得25% 
- 可左/右移得25% 
- 使用GENERIC以及PROCESS內之FOR LOOP方法來實現N位元(預設為8-bit)左/右位移萬用暫存器可得20% (需驗證位元變換，8位元變換16位元)
- 實驗報告30%
- 測試時，將改變clk,並以指撥開關平行輸入di，並將設定lr_sel，並且串列輸入sdi，而8顆LED燈上必須可正確顯示出暫存器qo之結果。

## 指定腳位 – 輸入
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/5122d221-f366-424b-8876-93affa50b63d)  

## 指定腳位 – 暫存器輸出
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b041b168-4ee2-4b95-88ba-949e58cc80f1)

