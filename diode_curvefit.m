%curve fitting for diode IN4007
% The 1N400x (or 1N4001 or 1N4000[2]) series is a family of popular 1 A
general-purpose silicon rectifier diodes commonly used in AC adapters for
common household appliances.
% Its blocking voltage varies from 50 volts (1N4001) to 1000 volts
(1N4007). This JEDEC device number series is available in the DO-41 axial
package,[3][4] and similar diodes are available in SMA and MELF surface
mount packages (in other part number series).[5][6]
function [fitresult, gof] = diode_curvefit(Voltage_12, Current_12)
%CREATEFIT1(VOLTAGE_12,CURRENT_12)
% Create a fit.
%
% Data for &#39;Custom_fit&#39; fit:
% X Input : Voltage_12
% Y Output: Current_12
% Output:
% fitresult : a fit object representing the fit.
% gof : structure with goodness-of fit info.

%% Fit: &#39;Custom_fit&#39;.
[xData, yData] = prepareCurveData( Voltage_12, Current_12 );
% Set up fittype and options.
ft = fittype( &#39;Is*(exp(x/(n*0.026))-1)&#39;, &#39;independent&#39;, &#39;x&#39;, &#39;dependent&#39;,
&#39;y&#39; );
opts = fitoptions( &#39;Method&#39;, &#39;NonlinearLeastSquares&#39; );
opts.Display = &#39;Off&#39;;
opts.StartPoint = [0.157613081677548 0.970592781760616];
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
% Plot fit with data.
figure( &#39;Name&#39;, &#39;Custom_fit&#39; );
h = plot( fitresult, xData, yData );
legend( h, &#39;Current_12 vs. Voltage_12&#39;, &#39;Custom_fit&#39;, &#39;Location&#39;,
&#39;NorthEast&#39; );
% Label axes
xlabel Voltage_12
ylabel Current_12
grid on
