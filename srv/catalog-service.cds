using com.logali as logali from '../db/schema';

service CatalogService {

    entity Headers as projection on logali.Headers;
    entity Items as projection on logali.Items;
}