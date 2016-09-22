Lecture8
 
data=xlsread('natgasprice.xls');
 
data= data(:,3); 
 
histogram(data);
 
transformed_data = log(data);
 
histogram(transformed_data);
 
years = length(data)/12;
 
monthly_matrix = reshape(transformed_data,12,years);
 
monthly_matrix= monthly_matrix';
 
stats = zeros(12,2); 
for i = 1:12
    stats(i,1) = mean(monthly_matrix(:,i));
    stats(i,2) = std(monthly_matrix(:,i));
end
 
trans_highest_mean= .4657*randn(1000,1) + 1.4545;
trans_lowest_mean= .4961*randn(1000,1) + 1.3914;
trans_highest_std= .5292*randn(1000,1) + 1.3364;
trans_lowest_std= .4036*randn(1000,1) + 1.4354;
 
highest_mean= exp(trans_highest_mean);
lowest_mean= exp(trans_lowest_mean);
highest_std= exp(trans_highest_std);
lowest_std= exp(trans_lowest_std);
 
figure
histogram(highest_mean,'FaceColor', [.8 0 0], 'EdgeColor', [0 0 0], 'LineWidth', .01);
hold on;
histogram(lowest_mean,'FaceColor', [.6 0 0], 'EdgeColor', [0 0 0], 'LineWidth', .01);
histogram(highest_std,'FaceColor', [.4 0 0], 'EdgeColor', [0 0 0], 'LineWidth', .01);
histogram(lowest_std,'FaceColor', [.2 0 0], 'EdgeColor', [0 0 0 ], 'LineWidth', .01);
 
legend('highest_mean','lowest_mean','highest_std','lowest_std','location','northeast')
 
legend boxoff
 
xlabel('Natural Gas Price');
ylabel('Quantity of Months');
