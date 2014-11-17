FactoryGirl.define do
  factory :post do
    user
    content <<-eos 
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque iaculis lacinia fringilla. Proin eleifend consequat nisi nec vehicula. Duis eu neque sed orci consectetur sollicitudin et ut lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris varius diam velit, vel viverra est pretium ac. Etiam odio felis, ornare id eros nec, dapibus efficitur metus. Phasellus at congue est, et interdum dui. Sed luctus, libero varius eleifend ultrices, dolor orci tempor leo, quis eleifend lorem arcu sed nulla. Aliquam nisl eros, aliquet vel tortor vitae, varius convallis neque. Etiam massa nisl, dictum non condimentum eget, blandit accumsan nisl.
    
    Curabitur congue dictum metus, vel hendrerit risus vehicula vel. Donec et vestibulum nunc. Aliquam erat volutpat. Curabitur venenatis dolor vitae lectus consectetur, suscipit commodo sapien interdum. Proin pellentesque viverra est, quis luctus nibh rutrum quis. Morbi a tristique sem. Praesent eget laoreet quam. Sed vel quam arcu. Nam ac est enim.
    
    Sed eget magna nec dolor fringilla eleifend quis ac purus. Praesent blandit sapien ut ultrices rutrum. Praesent in auctor metus. Nullam leo tellus, pulvinar sed massa non, sodales sollicitudin velit. Integer nec facilisis urna. Suspendisse et maximus sapien. Pellentesque malesuada sapien id nulla facilisis, a tempor sem lobortis. Vivamus et ligula eget quam efficitur lacinia. Sed tincidunt ullamcorper arcu, non sollicitudin ligula elementum eu. Phasellus congue aliquam ante, in fermentum nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent id quam sit amet mauris cursus consectetur. Suspendisse condimentum ultrices rhoncus. Suspendisse vitae ipsum non augue condimentum dignissim. Cras at mauris a metus vestibulum pellentesque ut nec massa.
    
    Vestibulum dictum luctus viverra. Nullam sapien mi, suscipit id felis quis, commodo finibus dolor. Ut vestibulum, nulla ut ultricies fringilla, nunc arcu consequat erat, eu porttitor risus mi at ante. Proin tincidunt auctor massa. Mauris ac cursus ex. Integer pulvinar ullamcorper venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus id leo pulvinar, convallis enim et, elementum tortor. Pellentesque ut laoreet ipsum, vel semper nibh. Phasellus nibh risus, mattis sed dapibus vehicula, tincidunt sed tellus. Donec aliquet aliquet tellus, sed pretium dui scelerisque eu. Pellentesque et interdum augue.
    
    Etiam scelerisque aliquam diam ut ullamcorper. Nullam varius consequat justo, non pulvinar sem blandit semper. Curabitur posuere tempus elit congue blandit. Curabitur semper dictum enim ac tristique. Phasellus vitae consectetur justo, sed feugiat nisi. Donec at elementum libero. Nullam eu eros non urna cursus condimentum id eu urna. Duis porttitor sed nisi vel luctus. Nulla facilisi. Duis posuere eleifend dui, eget tempor nunc fringilla in. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed facilisis metus ut accumsan tincidunt. Phasellus pulvinar sed augue consectetur posuere. Pellentesque accumsan ullamcorper ex sed sodales.
    
    Donec sed nunc finibus, eleifend lectus non, ornare lacus. Maecenas imperdiet dui ut diam dignissim aliquam. Nulla vitae eros quis elit porta tempus. Pellentesque mi libero, blandit ac ante non, tristique mattis nisi. Praesent in dolor facilisis, laoreet eros sit amet, sodales justo. Duis vel mauris.
  eos
  end
end
