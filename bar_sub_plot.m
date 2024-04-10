function  bar_sub_plot(parametername,axisnumber_90, axisnumber_180,matrix, idxr_180, idxl_180,idxr_90, idxl_90,no_trials, col ,ytext, xtext,idxr_180_w_f,idxl_180_w_f,idxr_90_w_f,idxl_90_w_f,app)

hunderteight_count =1;
ninety_count =1;


R_mean_woF_180= mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxr_180,5)));
L_mean_woF_180 = mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxl_180,5)));

R_mean_woF_90= mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxr_90,5)));
L_mean_woF_90 = mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxl_90,5)));
for tr = 1:no_trials
    if matrix(tr,4) ==1 % is 180
        bar(app.(axisnumber_180),hunderteight_count,app.datacontainer.PARAMETERS.(parametername)(:,tr), 'Horizontal', 'on', 'FaceColor', 'flat', 'CData', col{tr}, 'EdgeColor', 'none')
        hold(app.(axisnumber_180), 'on'); % Hold on to plot additional data on the same axes
        xline(app.(axisnumber_180),mean(app.datacontainer.PARAMETERS.(parametername)((matrix(idxl_180,5)))), 'Color',col{tr, 1})

        xline(app.(axisnumber_180), R_mean_woF_180, Linewidth=3, Color=[0, 0,0])
        xline(app.(axisnumber_180), L_mean_woF_180, Linewidth=3, Color=[192,192,192]/255)

        ylim(app.(axisnumber_180), [0, length(find(matrix(:,4)==1))+1])
        yticks(app.(axisnumber_180),[1: length(find(matrix(:,4)==1))]);
        ylabel(app.(axisnumber_180), (ytext), 'Interpreter','none', 'FontWeight', 'bold');
        xlabel(app.(axisnumber_180), (xtext), 'Interpreter','none');

        xline(app.(axisnumber_180),mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxr_180_w_f,5))), 'Linestyle', '--' , Linewidth=3, Color=[0, 0,0])
        xline(app.(axisnumber_180),mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxl_180_w_f,5))), 'Linestyle', '--' , Linewidth=3, Color=[192,192,192]/255)

        hunderteight_count = hunderteight_count+1;
    elseif matrix(tr,4) ==2 % is 90
        bar(app.(axisnumber_90),ninety_count,app.datacontainer.PARAMETERS.(parametername)(:,tr), 'Horizontal', 'on', 'FaceColor', 'flat', 'CData', col{tr}, 'EdgeColor', 'none')
        hold(app.(axisnumber_90), 'on'); % Hold on to plot additional data on the same axes
        xline(app.(axisnumber_90),mean(app.datacontainer.PARAMETERS.(parametername)((matrix(idxl_90,5)))), 'Color',col{tr, 1})

        xline(app.(axisnumber_90), R_mean_woF_90, Linewidth=3, Color=[0, 0,0])
        xline(app.(axisnumber_90), L_mean_woF_90, Linewidth=3, Color=[192,192,192]/255)


        xline(app.(axisnumber_90),mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxr_90_w_f,5))), 'Linestyle', '--' , Linewidth=3, Color=[0, 0,0])
        xline(app.(axisnumber_90),mean(app.datacontainer.PARAMETERS.(parametername)(matrix(idxl_90_w_f,5))), 'Linestyle', '--' , Linewidth=3, Color=[192,192,192]/255)


        ylabel(app.(axisnumber_90), (ytext), 'Interpreter','none', 'FontWeight', 'bold');
        xlabel(app.(axisnumber_90), (xtext), 'Interpreter','none');
        ylim(app.(axisnumber_90), [0, length(find(matrix(:,4)==2))+1])
        yticks(app.(axisnumber_90),[1: length(find(matrix(:,4)==2))]);
        ninety_count = ninety_count+1;
    end
end

end