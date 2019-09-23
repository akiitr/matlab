%
% irfz44n power mos
function [fitresult, gof] = mos1_uncox(Voltage_11,
Current_11)
%CREATEFIT3(VOLTAGE_11,CURRENT_11)
% Create a fit.
%
% Data for &#39;mos1&#39; fit:
% X Input : Voltage_11
% Y Output: Current_11
% Output:
% fitresult : a fit object representing the fit.
% gof : structure with goodness-of fit info.
%

%% Fit: &#39;mos1&#39;.
[xData, yData] = prepareCurveData( Voltage_11,
Current_11 );
% Set up fittype and options.
ft = fittype( &#39;k*6.4*(2-1)*(1+(0.01152)*x)&#39;,
&#39;independent&#39;, &#39;x&#39;, &#39;dependent&#39;, &#39;y&#39; );
opts = fitoptions( &#39;Method&#39;, &#39;NonlinearLeastSquares&#39;
);
opts.Display = &#39;Off&#39;;
opts.StartPoint = 0.913375856139019;
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
% Plot fit with data.
figure( &#39;Name&#39;, &#39;mos1&#39; );
h = plot( fitresult, xData, yData );
legend( h, &#39;Current_11 vs. Voltage_11&#39;, &#39;mos1&#39;,
&#39;Location&#39;, &#39;NorthEast&#39; );
% Label axes
xlabel Voltage_11
ylabel Current_11
grid on
