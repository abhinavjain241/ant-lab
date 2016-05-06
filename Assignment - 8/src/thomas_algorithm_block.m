function [ output_args ] = thomas_algorithm_block( mat_A,b )
    
    l = length(mat_A);
    
    if l==2,
        output_args = mat_A\b;
        return
    end
    
    for i=1:l-1,
        fac = mat_A(:,:,i+1,i) / mat_A(:,:,i,i);       
        mat_A(:,:,i+1,i) = mat_A(:,:,i+1,i) - fac * mat_A(:,:,i,i);
        mat_A(:,:,i+1,i+1) = mat_A(:,:,i+1,i+1) - fac * mat_A(:,:,i,i+1);
        if i~=l-1,
            mat_A(:,:,i+1,i+2) = mat_A(:,:,i+1,i+2) - fac * mat_A(:,:,i,i+2);
        end
        b(:,:,i+1,:) = b(:,:,i+1,:) - fac*b(:,:,i,:);
    end
    for i=l:-1:2,
        fac = mat_A(:,:,i-1,i) / mat_A(:,:,i,i);
        
        mat_A(:,:,i-1,i) = mat_A(:,:,i-1,i)- fac*mat_A(:,:,i,i);
        
        b(:,:,i-1,:) = b(:,:,i-1,:) - fac*b(:,:,i,:);
        
        output_args(:,i) = mat_A(:,:,i,i) \ b(:,:,i,:);
    end
    
    output_args(:,1) = mat_A(:,:,1,1) \ b(:,:,1,:);
    
%     output_args = b ./ diag(mat_A);

end

