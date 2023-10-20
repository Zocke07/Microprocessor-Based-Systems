# 實驗目標一、二: 七段顯示器解碼電路  
## 基本概念  
學習如何使用VHDL內建支援的布林運算子(AND、OR 、NOT 、NAND 、NOR 、XOR 、XNOR)建構符合預期結果的電路 。  
![Screenshot 2023-10-20 135403](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/11d11d7f-6170-41f1-81e8-295aa4eb2799)

## 實驗目的  
透過學習七段顯示器解碼過程,練習如何以VHDL邏輯函數方式實驗邏輯電路,並配合實作熟悉硬體電路架構與配置部分。

## 基本概念  
七段顯示器共有a, b, c, d, e, f, g等七段用來顯示數字0~9及一點p來 顯示小數點。  
![Screenshot 2023-10-20 135804](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b20cf961-1ed8-4620-973f-a8ef41196067)  

## 共陽極接法
![Screenshot 2023-10-20 135849](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/a3f7aba6-4b41-4c73-97e7-8c3f073621bf)  

## 共陽極七段顯示器解碼電路設計  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/7a6dfd7f-af13-4ae4-b18e-6c7ea0639eac)  
分析: 分析後可以得到上面真值表。
> 註: DE2-115實驗版為共陽極,如果遇到共陰極之七段顯示器,則將上圖真值表部分0和1互換即可,意即加上一個NOT閘。

化簡a ~ g輸出布林代數式如下:  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/6401350c-632e-4f77-b354-4943f236f4f6)  

## 電路設計  
右圖為以Quartus之RTL所viewer產生的電路圖  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/a5c9c993-2ab6-4f0d-a189-8e60c40da280)

## 指定腳位  
- 下表為範例所使用七段顯示 器為HEX0,如需使用到其 他顆七段顯示器,請自行查 詢規格書第36 、37 、38頁 。 (社團上可供下載)。
-  完成之後按下實驗板上自己 設定之腳位的指撥開關,即 可輸入 4-bit訊號給七段顯示器。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/971ecc5f-999d-4fb3-bf78-1c8f84f90c54)  
