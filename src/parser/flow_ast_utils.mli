(**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

type 'loc binding = 'loc * string
type 'loc ident = 'loc * string
type 'loc source = 'loc * string

val fold_bindings_of_pattern:
  ('a -> 'loc binding -> 'a) ->
  'a ->
  ('loc, 'loc) Flow_ast.Pattern.t' ->
  'a

val fold_bindings_of_variable_declarations:
  ('a -> 'loc binding -> 'a) ->
  'a ->
  ('loc, 'loc) Flow_ast.Statement.VariableDeclaration.Declarator.t list ->
  'a

val partition_directives:
  (Loc.t, Loc.t) Flow_ast.Statement.t list ->
  (Loc.t, Loc.t) Flow_ast.Statement.t list * (Loc.t, Loc.t) Flow_ast.Statement.t list

val negate_number_literal:
  float * string ->
  float * string

val loc_of_expression:
  ('a, 'a) Flow_ast.Expression.t -> 'a

val loc_of_statement:
  ('a, 'a) Flow_ast.Statement.t -> 'a

val loc_of_pattern:
  ('a, 'a) Flow_ast.Pattern.t -> 'a

module ExpressionSort: sig
  type t =
    | Array
    | ArrowFunction
    | Assignment
    | Binary
    | Call
    | Class
    | Comprehension
    | Conditional
    | Function
    | Generator
    | Identifier
    | Import
    | JSXElement
    | JSXFragment
    | Literal
    | Logical
    | Member
    | MetaProperty
    | New
    | Object
    | OptionalCall
    | OptionalMember
    | Sequence
    | Super
    | TaggedTemplate
    | TemplateLiteral
    | This
    | TypeCast
    | Unary
    | Update
    | Yield

  val to_string: t -> string
end

val string_of_binary_operator:
  Flow_ast.Expression.Binary.operator -> string
