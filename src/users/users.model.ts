import{Column, DataType, Model, Table} from "sequelize-typescript"

interface UserCreationAttrs{
    phone: string;
    pass: string;
}

@Table({tableName: 'users'})
export class User extends Model<User>{
    @Column({type: DataType.INTEGER, unique: true, autoIncrement: true, primaryKey: true})
    id: number;
    @Column({type: DataType.STRING, unique: true, allowNull: false, primaryKey: true})
    phone: string;
    @Column({type: DataType.STRING, allowNull: true})
    pass: string;
    @Column({type: DataType.STRING})
    refreshtoken0: string;
    @Column({type: DataType.STRING})
    refreshtoken1: string;
    @Column({type: DataType.STRING})
    refreshtoken2: string;
}

